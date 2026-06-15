{
  flake.modules.nixos.common =
    { pkgs, lib, ... }:
    let
      gitignores = [
        ".idea/"
        "*.iml"
        "*.iws"
        "*.ipr"
        ".vscode/*"
        "*~"
        "#*#"
        ".#*"
        "*.swp"
        "*.swo"
        "*.swn"
        ".project"
        ".classpath"
        ".settings/"
      ];
    in
    {
      programs.lazygit = {
        enable = true;
      };
      programs.git = {
        enable = true;
        lfs.enable = true;
        config = {
          advice.skippedCherryPicks = false;
          branch.sort = "-committerdate";
          # commit.gpgSign = true;
          core.excludesFile = pkgs.writeText ".gitignore" (lib.concatStringsSep "\n" gitignores);
          core.fsmonitor = true;
          core.untrackedCache = true;
          diff.algorithm = "histogram";
          diff.colorMoved = "default";
          diff.renames = true;
          fetch.prune = true;
          help.autocorrect = 10;
          init.defaultBranch = "master";
          merge.conflictStyle = "diff3";
          protocol.version = 2;
          pull.rebase = true;
          push.autoSetupRemote = true;
          push.default = "simple";
          rebase.autoStash = true;
          rebase.updateRefs = true;
          rerere.enabled = true;
          # tag.gpgSign = true;
          url."git@github.com:".insteadOf = [
            "gh:"
            "https://github.com/"
          ];
          user.name = "Ruslan Rakshinsky";
          user.email = "ch3rrix.dev@gmail.com";
        };
      };
    };
}
