{% set base_url = 'https://github.com/github/hub/releases/download' %}
{% set version = '2.13.0' %}

hub-directory:
  file.directory:
    - name: /opt/hub/
    - user: root
    - group: root
    - mode: 755

hub:
  file.directory:
    - name: /opt/hub/hub-linux-amd64-{{ version }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: hub-directory

  archive.extracted:
    - name: /opt/hub/
    - source: {{ base_url }}/v{{ version }}/hub-linux-amd64-{{ version }}.tgz
    # No checksums available
    - skip_verify: true
    - require:
      - file: hub

hub-cleanup:
  file.directory:
    - name: /opt/hub/
    - clean: True
    - require:
      - file: hub

hub-symlink:
  file.symlink:
    - name: /usr/local/bin/hub
    - target: /opt/hub/hub-linux-amd64-{{ version }}/bin/hub
    - require:
      - archive: hub
