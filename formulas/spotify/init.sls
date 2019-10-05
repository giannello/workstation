spotify:
  pkgrepo.managed:
    - humanname: Spotify
    - name: deb http://repository.spotify.com stable non-free
    - file: /etc/apt/sources.list.d/spotify.list
    - key_url: https://download.spotify.com/debian/pubkey.gpg

  pkg.installed:
    - name: spotify-client
    - require:
      - pkgrepo: spotify
