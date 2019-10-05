include:
  - git

salt-minion:
  pkg.installed:
    - name: salt-minion

  service.dead:
    - name: salt-minion
    - enable: false

gitfs:
  pkg.installed:
    - name: python3-pygit2
    - require:
      - pkg: git

  file.managed:
    - name: /etc/salt/minion.d/gitfs.conf
    - source: salt://salt-minion/files/gitfs.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: gitfs
    - watch_in:
      - service: salt-minion
