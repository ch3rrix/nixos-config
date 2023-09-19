{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 200;
    priority = -1;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 200;
  };
}
