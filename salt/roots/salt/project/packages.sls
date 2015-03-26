/home/vagrant/logs:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 777
    - makedirs: true

/home/vagrant/conf:
  file.directory:
    - require:
      - file: /home/vagrant/logs
