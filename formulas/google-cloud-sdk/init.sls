google-cloud-sdk:
  pkgrepo.managed:
    - name: deb https://packages.cloud.google.com/apt cloud-sdk
    - comps: main
    - file: /etc/apt/sources.list.d/google-cloud-sdk.list
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg

  pkg.installed:
    - pkgs:
      - google-cloud-sdk
      - kubectl
    - require:
      - pkgrepo: google-cloud-sdk
