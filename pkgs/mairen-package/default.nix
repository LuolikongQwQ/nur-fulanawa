{ lib, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "mairen-${version}";
  version = "0.0.1";
  src = ./.;
  buildPhase = ''
    cat <<EOF >> mairen
    #!/usr/bin/env bash

    if [ -z "$1" ]; then
       echo "$USER 透了麦仁！"
    else
       echo "$1 透了麦仁！"
    fi
    EOF
    
    cat <<EOF >> mai
    #!/usr/bin/env bash

    if [ -z "$1" ]; then
       echo "$USER 被卖了！"
    else
       echo "$1 被卖了！"
    fi
    EOF
  '';

  installPhase = ''
    mkdir -p $out/usr/bin
    install -Dm755 mai $out/usr/bin
    install -Dm755 mairen $out/usr/bin
  '';
}

