#
# Copyright (C) 2011 Taobao .Inc
# All rights reserved.
#
# This software is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at http://code.taobao.org/license.html.
#
# This software consists of voluntary contributions made by many
# individuals. For the exact contribution history, see the revision
# history and logs, available at http://code.taobao.org/.

from django.contrib.auth.decorators import login_required
from taocode2.models import *
from taocode2.helper.utils import *
from taocode2.helper import consts,xmlo
from taocode2 import settings
from taocode2.apps.project.views import build_prj_nav_menu
from taocode2.apps.project.admin import can_access
from taocode2.apps.repos import svn
from taocode2.apps.wiki.views import safe_esc

from pygments import highlight
from pygments.lexers import get_lexer_for_filename, DiffLexer
from pygments.formatters import HtmlFormatter
from mimetypes import guess_type,add_type
from isodate import  parse_datetime
from taocode2.apps.user import activity
from django.db.models import Q
from django.utils.encoding import smart_unicode

import chardet, os

__author__ = 'luqi@taobao.com'


add_type('text/x-java', '.java')
add_type('text/x-cpp', '.cpp')
add_type('text/x-cpp', '.cc')
add_type('text/x-cpp', '.cxx')
add_type('text/x-cpp', '.h')
add_type('text/x-cpp', '.hxx')
add_type('text/x-cpp', '.hpp')
add_type('text/x-ruby', '.rb')
add_type('text/x-yml', '.yml')
add_type('text/x-sql', '.sql')
add_type('text/x-cfg', '.cfg')

def force_unicode(v):
    try:
        #enc = chardet.detect(v)['encoding']
        #if enc is None:
        #    enc = 'utf8'
        return smart_unicode(v, 'gbk')
    except:
        pass
    return v

def get_author(v):
    v = str(v)
    u = q_get(User, Q(name__iexact=v) | Q(email__iexact=v),
              status = consts.USER_ENABLE)
    if u is None:
        return ''

    return u.name

def build_paths(path):
    vals = path.split('/')
    paths = []
    for i in range(1, len(vals) - 1):
        paths.append({'url':'/'.join(vals[1:i+1]),'path':vals[i]})
    return paths


def check_acl(request, name, path):
    project = q_get(Project, name=name)
    resp = can_access(project, request.user)
    if resp != None:
        return resp, None, request.rc
    
    path = svn.safe_path(path)

    rc = request.rc
    rc.navmenus = build_prj_nav_menu(request, project, 'src')

    rc.project = project

    rc.pagename = path
    rc.pagedesc = project.title
    rc.path = path   
    rc.paths = build_paths(path)
    if path != '/' and path[-1] == '/':
        rc.parent = os.path.split(path[:-1])[0]
        if rc.parent != '/':
            rc.parent += '/'

    r = svn.ADMIN_REPOS(name, path)
    return resp, r, rc

def update_last_log(request, r, project):
    #ReposChecker

    rchk = q_get(ReposChecker, project = project)
    if rchk is None:
        rchk = ReposChecker()
        rchk.project = project
        last_rev = 1
    else:
        last_rev = rchk.last_rev
        
        info = svn.INFO(r)
        rev = int(str(info.entry.commit['revision']))
        if rev <= last_rev:
            return
        
    try:
        logs = get_logs(request, r, '%s:HEAD'%last_rev, -1)
        for log in logs:
            last_rev = log['rev']
            author = unicode(log['author'])
            u = q_get(User, Q(name__iexact=author) | Q(email__iexact=author),
                      status = consts.USER_ENABLE)
        
            if u is None:
                continue
            msg = unicode(log['msg'])
            msg = msg[:128]

            activity.new_commit(project, u, last_rev, msg, 
                                ctime=log['date'])
    except:
        import traceback
        traceback.print_exc()
        raise

    if rchk.last_rev != last_rev:
        rchk.last_rev = last_rev
        rchk.save()

def browse(request, name, path='/'):
    resp, r, rc = check_acl(request, name, path)
    if resp is not None:
        return resp

    
    if path[-1] != '/':
        return view_file(request, name, path, r)

    if path == '/':
        update_last_log(request, r, rc.project)

    o = svn.LIST(r)
    
    files = []
    entrys = getattr(o.list, 'entry',[])
    if type(entrys) != list:
        entrys = [entrys]

    for e in entrys:
        co = e.commit
        f = {
            'dir':e['kind'] == 'dir' and True or False,
            'name':unicode(e.name),
            'rev':co['revision'],
            'date':parse_datetime(str(co.date)),
            'author':get_author(getattr(e, 'author', '')),
            'size':int(str(getattr(e, 'size', '0')))
            }

        files.append(f)

    rc.files = files 
    rc.REPOS = svn.REPOS(name, '/trunk')
    if path == '/':
        for v in ['/trunk/README', '/README']:
            try:
                c = svn.CAT(svn.ADMIN_REPOS(name, v))
                if len(c) > 0:
                    rc.README = c
                    break
            except:
                continue
    
    return send_response(request, 
                         'repos/browse.html')

def view_file(request, name, path, r):   
    rc = request.rc
    ul = svn.REPOS(name, '/' + path)

    if request.GET.get('orig', None) is not None:
        return redirect(ul)

    info = svn.INFO(r)

    rc.mtime = parse_datetime(str(info.entry.commit.date))
    rc.author = get_author(getattr(info.entry.commit, 'author', ''))
    rc.rev = info.entry.commit['revision']

    ft = guess_type(path)[0]
    fname = os.path.split(path)[1]

    if ft is None:
        if fname.upper() in ('README','AUTHORS','COPYING','INSTALL',
                             'CHANGELOG', 'NEWS', 'CONTRIBUTORS'):
            rc.content = svn.CAT(r)
        else:
            rc.srcurl = ul
    elif ft.startswith('text'):
        filecon = svn.CAT(r)
        rc.content = force_unicode(filecon)

        hf = HtmlFormatter(encoding='utf8')
        rc.content_style = hf.get_style_defs('.highlight')
        rc.content = highlight(safe_esc(force_unicode(rc.content)), get_lexer_for_filename(fname), hf)
    elif ft.startswith('image'):
        rc.imgurl = ul
    else:
        rc.srcurl = ul

    return send_response(request, 
                             'repos/view_file.html')

def get_logs(request, r, rev=None, limit=20):

    o = svn.LOG(r, rev, limit)

    logs = []
    
    entrys = getattr(o.log, 'logentry',[])
    if type(entrys) != list:
        entrys = [entrys]

    for e in entrys:
        log = {
            'rev':e['revision'],
            'author':get_author(getattr(e, 'author', '')),
            'date':parse_datetime(str(e.date)),
            'msg':unicode(e.msg)
        }
        logs.append(log)
    return logs
    
def log(request, name, path='/', rev=None):
    resp, r, rc = check_acl(request, name, path)
    if resp is not None:
        return resp

    o = svn.LOG(r, rev, limit=-1)
    e = o.log.logentry

    rc.author = get_author(getattr(e, 'author', ''))
    rc.mtime = parse_datetime(str(e.date))
    rc.msg = unicode(e.msg)

    paths = e.paths
    if type(paths) != list:
        paths = [paths]

    cfiles = []
    for p in e.paths:
        path = {'dir':p['kind'] == 'dir' and True or False,
                'action':p['action'],
                'name':unicode(p)}
        cfiles.append(path)

    rc.cfiles = cfiles
    rc.rev = rev
    
    content = svn.DIFF(r, rev)
    if content is not None and len(content) > 0:
        hf = HtmlFormatter(encoding='utf8')
        rc.content_style = hf.get_style_defs('.highlight')
        rc.content = highlight(safe_esc(force_unicode(content)), DiffLexer(), hf)

    return send_response(request, 
                         'repos/view_log.html')

def logs(request, name, path='/'):
    resp, r, rc = check_acl(request, name, path)
    if resp is not None:
        return resp

    rc.logs = get_logs(request, r, limit=100)

    return send_response(request, 
                         'repos/view_logs.html')
    
def diff(request, name, revN, revM, path='/'):
    resp, r, rc = check_acl(request, name, path)
    if resp is not None:
        return resp

    content = svn.DIFF(r, revN, revM)

    if content is not None and len(content) > 0:
        hf = HtmlFormatter(encoding='utf8')
        rc.content_style = hf.get_style_defs('.highlight')
        rc.content = highlight(safe_esc(force_unicode(content)), DiffLexer(), hf)

    rc.revN = revN
    rc.revM = revM
    return send_response(request, 
                         'repos/view_diff.html')

