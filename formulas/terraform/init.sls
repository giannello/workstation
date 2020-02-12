{% set base_url = 'https://releases.hashicorp.com/terraform' %}
{% set version = '0.12.20' %}

terraform-directory:
  file.directory:
    - name: /opt/terraform/
    - user: root
    - group: root
    - mode: 755

terraform:
  file.directory:
    - name: /opt/terraform/{{ version }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: terraform-directory

  archive.extracted:
    - name: /opt/terraform/{{ version }}
    - enforce_toplevel: false
    - source: {{ base_url }}/{{ version }}/terraform_{{ version }}_linux_amd64.zip
    - source_hash: {{ base_url }}/{{ version }}/terraform_{{ version }}_SHA256SUMS
    - require:
      - file: terraform

terraform-cleanup:
  file.directory:
    - name: /opt/terraform/
    - clean: True
    - require:
      - file: terraform

terraform-symlink:
  file.symlink:
    - name: /usr/local/bin/terraform
    - target: /opt/terraform/{{ version }}/terraform
    - require:
      - archive: terraform
