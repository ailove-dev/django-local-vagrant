base:
  '*':
    - packages
    - nginx
    - uwsgi
    - postgresql
    - supervisor
    - mysql
    # project
    - project.packages
    - project.nginx
    - project.uwsgi
    - project.postgresql
    - project.mysql
    - project.virtualenv
