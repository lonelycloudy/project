import os, sys
sys.path.append('/var/django')
sys.path.append('/var/django/taocode2')
os.environ['DJANGO_SETTINGS_MODULE'] = 'taocode2.settings'

import django.core.handlers.wsgi

_application = django.core.handlers.wsgi.WSGIHandler()

def application(environ, start_response):
   if environ['wsgi.url_scheme'] == 'https':
        environ['HTTPS'] = 'on'
    environ['PATH_INFO'] = environ['SCRIPT_NAME'] + environ['PATH_INFO']
    return _application(environ, start_response)
