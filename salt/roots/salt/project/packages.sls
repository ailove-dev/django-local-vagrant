/home/vagrant/logs:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 777
    - makedirs: true

/home/vagrant/conf:
  file.directory:
    - user: vagrant
    - group: vagrant
    - makedirs: true
    - require:
      - file: /home/vagrant/logs
