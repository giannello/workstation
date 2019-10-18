{% set base_url = 'https://github.com/bitnami-labs/sealed-secrets/releases/download/' %}
{% set version = 'v0.9.2' %}

kubeseal-directory:
  file.directory:
    - name: /opt/kubeseal
    - user: root
    - group: root
    - mode: 755

kubeseal:
  file.managed:
    - name: /opt/kubeseal/kubeseal-{{ version }}
    - source: {{ base_url }}/{{ version }}/kubeseal-linux-amd64
    - skip_verify: True
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: kubeseal-directory

kubeseal-cleanup:
  file.directory:
    - name: /opt/kubeseal/
    - clean: True
    - require:
      - file: kubeseal

kubeseal-symlink:
  file.symlink:
    - name: /usr/local/bin/kubeseal
    - target: /opt/kubeseal/kubeseal-{{ version }}
    - require:
      - file: kubeseal
