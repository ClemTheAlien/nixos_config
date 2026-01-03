{
services.keyd = {
  enable = true;
  keyboards = {
    default = {
      ids = [ "*" ];  # Apply to all keyboards
      settings = {
        main = {
          esc = "grave";      # Make Esc key output ` (backtick/grave)
          insert = "esc";     # Make Insert key output Esc
        };
      };
    };
  };
};
}