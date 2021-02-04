{
  description = "Yet another photo gallery generator.";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.gal =
    with import nixpkgs { system = "x86_64-linux"; };
    stdenv.mkDerivation {
      pname = "gal";
      version = "0.1";

      src = self;

      installPhase = ''
        mkdir -p $out/bin $out/share/gal
        cp gal $out/bin
        cp style.css $out/share/gal

        sed -i 's:convert:${imagemagick}/bin/convert:g' $out/bin/gal
        sed -i "s:cp style.css:cp $out/share/gal/style.css:g" $out/bin/gal
      '';
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.gal;

  };
}
