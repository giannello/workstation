tlp:
  pkg.installed:
    - name: tlp

  service.running:
    - name: tlp
    - enable: true
