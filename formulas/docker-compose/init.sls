include:
  - docker
  - python3

docker-compose:
  pip.installed:
    - name: docker-compose
    - require:
      - pkg: docker
      - pkg: python3-pip
