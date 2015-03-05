supervisor:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: supervisor

reload_supervisor:
  cmd.run:
    - name: "supervisorctl update"
    - require:
      - pkg: supervisor
