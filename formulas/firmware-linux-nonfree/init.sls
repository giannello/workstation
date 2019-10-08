include:
  - debian

firmware-linux-nonfree:
  pkg.installed:
    - name: firmware-linux-nonfree
    - require:
      - sls: debian
