{ config, pkgs, ... }: {
# 3. SearXNG Configuration (The module is 'searx', the package is 'searxng')
  services.searx = {
    enable = true;
    # Ensure it uses the modern SearXNG package
    package = pkgs.searxng; 
    
    settings = {
      server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "d8f3a9e1c2b5a4f6e7d8c9b0a1f2e3d4c5b6a7f8e9d0c1b2a3f4e5d6c7b8a9f0";
      };

      # Fix for the 'KeyError: wikidata' crash in 25.11
      engines = [
        { name = "wikidata"; engine = "wikidata"; disabled = true; }
      ];
    };
  };

  # 4. Networking / Firewall
  networking.firewall.allowedTCPPorts = [ 8888 ];
}
