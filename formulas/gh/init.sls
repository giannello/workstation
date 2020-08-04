{% set base_url = 'https://github.com/cli/cli/releases/download' %}
{% set version = '0.11.1' %}

gh:
  pkg.installed:
    - sources:
      - gh: {{ base_url }}/v{{ version }}/gh_{{ version }}_linux_amd64.deb
