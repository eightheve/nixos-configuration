final: prev:

let
  version = "0.24.1-slskdn.32";

  sources = {
    x86_64-linux = {
      url = "https://github.com/snapetech/slskdn/releases/download/${version}/slskdn-${version}-linux-x64.zip";
      sha256 = "97f8a416672c9721d6f20f95ab656621ae0804ff4f3be8654dc5f4814111ea97";
    };
    aarch64-linux = {
      url = "https://github.com/snapetech/slskdn/releases/download/${version}/slskdn-${version}-linux-arm64.zip";
      sha256 = "e81d49779e57a340eb199b29f9a5ead4aabb4a18ed8fcbaa95104103405b520c";
    };
  };

  srcConfig = sources.${prev.stdenv.hostPlatform.system};
in
{
  slskd = prev.stdenv.mkDerivation {
    pname = "slskd";
    inherit version;

    src = prev.fetchurl {
      inherit (srcConfig) url sha256;
    };

    nativeBuildInputs = [ prev.unzip prev.makeWrapper ];

    unpackPhase = "unzip $src";

    installPhase = ''
      mkdir -p $out/libexec/slskd $out/bin
      cp -r * $out/libexec/slskd/
      chmod +x $out/libexec/slskd/slskd

      makeWrapper $out/libexec/slskd/slskd $out/bin/slskd \
        --prefix LD_LIBRARY_PATH : ${prev.lib.makeLibraryPath [ prev.icu prev.openssl ]}
    '';
  };
}

