{% set base_url = 'https://github.com/instrumenta/conftest/releases/download' %}
{% set version = '0.14.0' %}

conftest-directory:
  file.directory:
    - name: /opt/conftest/
    - user: root
    - group: root
    - mode: 755

conftest:
  file.directory:
    - name: /opt/conftest/{{ version }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: conftest-directory

  archive.extracted:
    - name: /opt/conftest/{{ version }}
    - enforce_toplevel: false
    - source: {{ base_url }}/v{{ version }}/conftest_{{ version }}_Linux_x86_64.tar.gz
    - source_hash: {{ base_url }}/v{{ version }}/checksums.txt
    - require:
      - file: conftest

conftest-cleanup:
  file.directory:
    - name: /opt/conftest/
    - clean: True
    - require:
      - file: conftest

conftest-symlink:
  file.symlink:
    - name: /usr/local/bin/conftest
    - target: /opt/conftest/{{ version }}/conftest
    - require:
      - archive: conftest
