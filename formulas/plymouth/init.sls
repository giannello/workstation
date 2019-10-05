plymouth:
  pkg.installed:
    - name: plymouth

grub-config:
  ini.options_present:
    - name: /etc/default/grub
    - separator: '='
    - sections:
        GRUB_CMDLINE_LINUX_DEFAULT: '"quiet splash"'
        GRUB_GFXMODE: 1920x1080

  cmd.run:
    - name: update-grub2
    - onchanges:
      - ini: grub-config
