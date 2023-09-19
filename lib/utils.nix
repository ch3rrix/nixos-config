{ lib
, ...
}:

{
  concat = with lib; (x: y: map (path: x + lib.substring (lib.stringLength (toString ./.)) (-1) (toString path)) y);
}
