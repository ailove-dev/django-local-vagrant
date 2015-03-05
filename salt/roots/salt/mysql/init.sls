mysql-server:
  pkg.installed:
    - name: mysql-server
    - require:
      - pkg: mysql-client
  service.running:
    - name: mysql
    - enable: True
    - reload: True

mysql-python:
  pkg.installed:
    - pkgs:
      - python-mysqldb
    - require:
      - pkg: mysql-lib
      - service: mysql

mysql-client:
  pkg.installed:
    - name: mysql-client

mysql-conf:
  cmd.run:
    - name: sed -i "s/bind-address.*=.*/bind-address=0.0.0.0/" /etc/mysql/my.cnf
    - require:
      - pkg: mysql-server

mysql-root-user:
  mysql_user.present:
    - name: root
    - password: {{ pillar['mysql']['root_password'] }}
    - require:
      - pkg: mysql-python
    - require:
      - service: mysql

mysql-lib:
  pkg.installed:
    - name: libmysqlclient-dev
    - require:
      - pkg: mysql-server
