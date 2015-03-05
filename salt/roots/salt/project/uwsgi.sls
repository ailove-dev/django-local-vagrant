include:
  - uwsgi
  - project.virtualenv
  - project.packages

uwsgi-app:
  file.managed:
    - name: /home/vagrant/conf/uwsgi.ini
    - source: salt://project/uwsgi.ini
    - template: jinja
    - makedirs: true
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - pip: uwsgi

enable-uwsgi-app:
  file.symlink:
    - name: /etc/uwsgi/vassals/example.ini
    - target: /home/vagrant/conf/uwsgi.ini
    - force: false
    - require:
      - file: uwsgi-app
      - file: /etc/uwsgi/vassals
      - virtualenv: /home/vagrant/python
      - file: /home/vagrant/conf
