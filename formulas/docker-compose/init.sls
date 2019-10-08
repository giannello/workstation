include:
  - docker

docker-compose:
  pkg.installed:
    - name: docker-compose
    - require:
      - pkg: docker
