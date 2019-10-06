debian-repos:
  pkgrepo.managed:
    - name: deb http://deb.debian.org/debian/ buster
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-src:
  pkgrepo.managed:
    - name: deb-src http://deb.debian.org/debian/ buster
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-security:
  pkgrepo.managed:
    - name: deb http://security.debian.org/debian-security buster/updates
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-security-src:
  pkgrepo.managed:
    - name: deb-src http://security.debian.org/debian-security buster/updates
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-updates:
  pkgrepo.managed:
    - name: deb http://deb.debian.org/debian/ buster-updates
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-updates-src:
  pkgrepo.managed:
    - name: deb-src http://deb.debian.org/debian/ buster-updates
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list
