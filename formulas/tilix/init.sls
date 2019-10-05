tilix:
  pkg.installed:
    - name: tilix

  alternatives.set:
    - name: x-terminal-emulator
    - path: /usr/bin/tilix.wrapper
    - require:
      - pkg: tilix
