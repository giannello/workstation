{% set base_url = 'https://storage.googleapis.com/cloudsql-proxy' %}
{% set version = '1.16' %}

cloud-sql-proxy-directory:
  file.directory:
    - name: /opt/cloud-sql-proxy/
    - user: root
    - group: root
    - mode: 755

cloud-sql-proxy:
  file.managed:
    - name: /opt/cloud-sql-proxy/cloud_sql_proxy
    - source: {{ base_url }}/v{{ version }}/cloud_sql_proxy.linux.amd64
    - skip_verify: true
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: cloud-sql-proxy-directory

cloud-sql-proxy-symlink:
  file.symlink:
    - name: /usr/local/bin/cloud_sql_proxy
    - target: /opt/cloud-sql-proxy/cloud_sql_proxy
    - require:
      - file: cloud-sql-proxy
