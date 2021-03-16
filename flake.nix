{
  description = "Yet another photo and video gallery generator.";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.gal =
    with import nixpkgs { system = "x86_64-linux"; };
    let
      pname = "galier";
      version = "0.1";
      install = writeScriptBin "install" ''
        ${toybox}/bin/mkdir -p $out/bin $out/share/galier
        ${toybox}/bin/cp $src/galier $out/bin
        ${toybox}/bin/cp $src/style.css $out/share/galier

        ${toybox}/bin/sed -i 's:convert:${imagemagick}/bin/convert:g' $out/bin/galier
        ${toybox}/bin/sed -i 's:cwebp:${libwebp}/bin/cwebp:g' $out/bin/galier
        ${toybox}/bin/sed -i 's:ffmpeg:${ffmpeg}/bin/ffmpeg:g' $out/bin/galier
        ${toybox}/bin/sed -i 's:ffprobe:${ffmpeg}/bin/ffprobe:g' $out/bin/galier
        ${toybox}/bin/sed -i "s:cp style.css:cp $out/share/galier/style.css:g" $out/bin/galier
      '';

    in
    derivation {
      name = "${pname}-${version}";
      builder = "${bash}/bin/bash";
      args = [ "${install}/bin/install" ];
      src = self;
      system = "x86_64-linux";
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.gal;

  };
}
