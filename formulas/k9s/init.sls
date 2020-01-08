{% set base_url = 'https://github.com/derailed/k9s/releases/download' %}
{% set version = '0.11.2' %}

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
    - source: {{ base_url }}/{{ version }}/k9s_{{ version }}_linux_x86_64.tar.gz
    # Due to the checksums.txt format, the hash check fails.
    # - source_hash: {{ base_url }}/{{ version }}/checksums.txt
    - skip_verify: true
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
