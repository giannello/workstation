python3:
  pkg.installed

python3-pip:
  pkg.installed:
    - name: python3-pip
    - require:
      - pkg: python3

pipenv:
  pkg.installed:
    - name: pipenv
    - require:
      - pkg: python3
