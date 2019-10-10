include:
  - python3

pre-commit:
  pip.installed:
    - name: pre-commit
    - require:
      - pkg: python3-pip
