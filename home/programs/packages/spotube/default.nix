{ fetchFromGitHub
, flutter
, lib
}:
flutter.buildFlutterApplication rec {
  pname = "spotube";
  version = "3.1.2";

  src = fetchFromGitHub {
    owner = "KRTirtho";
    repo = "spotube";
    #rev = "master";
    hash = "";
    fetchSubmodules = true;
  };

  #pubspecLockFile = ./pubspec.lock;
  #depsListFile = ./deps.json;
  #vendorHash = lib.fakeHash;
}
