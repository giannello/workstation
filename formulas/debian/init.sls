debian-repos:
  pkgrepo.managed:
    - name: deb http://deb.debian.org/debian/ testing
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-src:
  pkgrepo.managed:
    - name: deb-src http://deb.debian.org/debian/ testing
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-security:
  pkgrepo.managed:
    - name: deb http://security.debian.org/ testing-security
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list

debian-repos-security-src:
  pkgrepo.managed:
    - name: deb-src http://security.debian.org/ testing-security
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list
