{ lib, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "mairen-${version}";
  version = "0.0.1";
  src = ./.;
  buildPhase = ''
    mkdir -p $src/usr/bin
    cat <<EOF >> $src/usr/bin/mairen
    #!/usr/bin/env bash

    if [ -z "$1" ]; then
       echo "$USER 透了麦仁！"
    else
       echo "$1 透了麦仁！"
    fi
    EOF
    
    cat <<EOF >> $src/usr/bin/mai
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
    install -Dm755 $src/usr/bin/mai $out/usr/bin
    install -Dm755 $src/usr/bin/mairen $out/usr/bin
  '';
}

