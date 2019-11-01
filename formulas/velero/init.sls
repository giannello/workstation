{% set base_url = 'https://github.com/vmware-tanzu/velero/releases/download' %}
{% set version = 'v1.1.0' %}

velero-directory:
  file.directory:
    - name: /opt/velero/
    - user: root
    - group: root
    - mode: 755

velero:
  file.directory:
    - name: /opt/velero/velero-{{ version }}-linux-amd64
    - group: root
    - mode: 755
    - require:
      - file: velero-directory

  archive.extracted:
    - name: /opt/velero/
    - source: {{ base_url }}/{{ version }}/velero-{{ version }}-linux-amd64.tar.gz
    - source_hash: {{ base_url }}/{{ version }}/CHECKSUM
    - require:
      - file: velero

velero-cleanup:
  file.directory:
    - name: /opt/velero/
    - clean: True
    - require:
      - file: velero

velero-symlink:
  file.symlink:
    - name: /usr/local/bin/velero
    - target: /opt/velero/velero-{{ version }}-linux-amd64/velero
    - require:
      - archive: velero
