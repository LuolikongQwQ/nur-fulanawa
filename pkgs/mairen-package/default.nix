{ stdenv }:
stdenv.mkDerivation rec {
  name = "mairen-${version}";
  version = "0.0.1";
  src = ./.;
  nativeBuildInputs = [ zstd ];
  unpackPhase = ''
    zstd -d $src/mairen-bin-2.0.0-1-any.pkg.tar.zst
    tar -xvf $src/mairen-bin-2.0.0-1-any.pkg.tar
  '';
  installPhase = ''
    install -Dm744 $src/usr/bin/* $out
  '';
}

