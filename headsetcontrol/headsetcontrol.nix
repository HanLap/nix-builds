{ stdenv, fetchurl, cmake, hidapi }:


stdenv.mkDerivation {
  name = "headsetcontrol";
  version = "2.6";

  src = fetchurl {
    url = "https://github.com/Sapd/HeadsetControl/archive/refs/tags/2.6.tar.gz";
    sha256 = "4f785af09cbf3dffe7050029f310b77943d68612a4e7544118cddb8f682eadc6";
  };

  buildInputs = [
    cmake
    hidapi
  ];

  configurePhase = ''
    mkdir build
    cd build
    cmake ..
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp headsetcontrol $out/bin
  '';
}