{...}: {
  location = {
    provider = "geoclue2";
    latitude = 51.51;
    longidtude = -0.12;
  };

  services.geoclue2.enable = true;
  services.geoclue2.appConfig = {
    "gammastep" = {
      isAllowed = true;
      isSystem = false;
      users = ["1000"];
    };
  };
}
