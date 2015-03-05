include:
  - mysql

mysql-project-db:
  mysql_database.present:
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ pillar['mysql']['root_password'] }}
    - connection_port: 3306
    - name: {{ pillar['mysql']['db'] }}
    - require:
      - service: mysql
      - pkg: mysql-python

mysql-project-user:
  mysql_user.present:
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ pillar['mysql']['root_password'] }}
    - connection_port: 3306
    - name: {{ pillar['mysql']['user'] }}
    - password: {{ pillar['mysql']['password'] }}
    - require:
      - service: mysql
      - pkg: mysql-python

mysql-project-grants:
  mysql_grants.present:
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ pillar['mysql']['root_password'] }}
    - connection_port: 3306
    - database: {{ pillar['mysql']['db'] }}.*
    - grant: ALL PRIVILEGES
    - user: {{ pillar['mysql']['user'] }}
    - require:
      - mysql_database: {{ pillar['mysql']['db'] }}
      - mysql_user: {{ pillar['mysql']['user'] }}
