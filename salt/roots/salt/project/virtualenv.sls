include:
  - packages

/home/vagrant/python:
  virtualenv.managed:
    - no_site_packages: True
    - distribute: True
    - runas: vagrant
    - requirements: /home/vagrant/repo/dev/requirements.txt
    - require:
      - pkg: python-virtualenv
      - pkg: python-dev
