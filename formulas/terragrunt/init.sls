{% set base_url = 'https://github.com/gruntwork-io/terragrunt/releases/download' %}
{% set version = 'v0.19.29' %}

include:
  - terraform

terragrunt-directory:
  file.directory:
    - name: /opt/terragrunt
    - user: root
    - group: root
    - mode: 755

terragrunt:
  file.managed:
    - name: /opt/terragrunt/terragrunt-{{ version }}
    - source: {{ base_url }}/{{ version }}/terragrunt_linux_amd64
    - source_hash: {{ base_url }}/{{ version }}/SHA256SUMS
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: terragrunt-directory

terragrunt-cleanup:
  file.directory:
    - name: /opt/terragrunt/
    - clean: True
    - require:
      - file: terragrunt

terragrunt-symlink:
  file.symlink:
    - name: /usr/local/bin/terragrunt
    - target: /opt/terragrunt/terragrunt-{{ version }}
    - require:
      - file: terragrunt
