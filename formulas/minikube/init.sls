{% set base_url = 'https://github.com/kubernetes/minikube/releases/download' %}
{% set version = 'v1.6.2' %}

include:
  - virtualbox

minikube-directory:
  file.directory:
    - name: /opt/minikube
    - user: root
    - group: root
    - mode: 755

minikube:
  file.managed:
    - name: /opt/minikube/minikube-{{ version }}
    - source: {{ base_url }}/{{ version }}/minikube-linux-amd64
    - source_hash: {{ base_url }}/{{ version }}/minikube-linux-amd64.sha256
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: minikube-directory

minikube-cleanup:
  file.directory:
    - name: /opt/minikube/
    - clean: True
    - require:
      - file: minikube

minikube-symlink:
  file.symlink:
    - name: /usr/local/bin/minikube
    - target: /opt/minikube/minikube-{{ version }}
    - require:
      - file: minikube
