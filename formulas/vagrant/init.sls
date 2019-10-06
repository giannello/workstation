include:
  - virtualbox

vagrant:
  pkg.installed:
    - name: vagrant
    - require:
      - pkg: virtualbox
