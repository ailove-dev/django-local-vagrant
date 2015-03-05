include:
  - nginx
  - project.packages

nginx-conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/default
    - source: salt://project/nginx.conf
    - template: jinja
    - makedirs: true
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - pkg: nginx
