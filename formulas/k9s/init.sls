{% set base_url = 'https://github.com/derailed/k9s/releases/download' %}
{% set version = '0.14.0' %}

k9s-directory:
  file.directory:
    - name: /opt/k9s/
    - user: root
    - group: root
    - mode: 755

k9s:
  file.directory:
    - name: /opt/k9s/{{ version }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: k9s-directory

  archive.extracted:
    - name: /opt/k9s/{{ version }}
    - enforce_toplevel: false
    - source: {{ base_url }}/v{{ version }}/k9s_Linux_x86_64.tar.gz
    - source_hash: {{ base_url }}/v{{ version }}/checksums.txt
    - require:
      - file: k9s

k9s-cleanup:
  file.directory:
    - name: /opt/k9s/
    - clean: True
    - require:
      - file: k9s

k9s-symlink:
  file.symlink:
    - name: /usr/local/bin/k9s
    - target: /opt/k9s/{{ version }}/k9s
    - require:
      - archive: k9s
