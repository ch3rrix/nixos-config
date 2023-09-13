{pkgs, ...}: {
  home.packages = [
    (pkgs.writers.writeBashBin "screenshot" ''
           if [[ "$1" == "-area" ]] ; then
      maim --hidecursor --select /tmp/screenshot.png && dragon -T /tmp/screenshot.png
           elif [[ "$1" == "-full" ]] ; then
      maim --hidecursor /tmp/screenshot.png && dragon -T /tmp/screenshot.png
           fi
    '')
    pkgs.maim
    pkgs.scrot
  ];
}
