{% set base_url = 'https://github.com/jonmosco/kube-ps1/archive/' %}
{% set version = '0.7.0' %}

kube-ps1-directory:
  file.directory:
    - name: /opt/kube-ps1/
    - user: root
    - group: root
    - mode: 755

kube-ps1:
  file.directory:
    - name: /opt/kube-ps1/kube-ps1-{{ version }}
    - group: root
    - mode: 755
    - require:
      - file: kube-ps1-directory

  archive.extracted:
    - name: /opt/kube-ps1/
    - source: {{ base_url }}/v{{ version }}.tar.gz
    - skip_verify: true
    - require:
      - file: kube-ps1

kube-ps1-cleanup:
  file.directory:
    - name: /opt/kube-ps1/
    - clean: True
    - require:
      - file: kube-ps1

kube-ps1-symlink:
  file.symlink:
    - name: /usr/local/bin/kube-ps1.sh
    - target: /opt/kube-ps1/kube-ps1-{{ version }}/kube-ps1.sh
    - require:
      - archive: kube-ps1
