{ inputs, ... }:
{
  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    {
      devshells.default = {
        # TODO: edit to tailor my setup
        commands = [
          {
            name = "update";
            command = ''
              echo "=> Updating flake inputs"
              nix flake update

              git add flake.lock
              git commit -m "chore: update flake.lock"
              git push
            '';
          }
          {
            name = "rebuild";
            command = ''
              hostname=$1

              echo -e "\n=> Deploying system '$hostname'"
              nh os switch \
                  --hostname $hostname \
                  --target-host root@$hostname \
                  --build-host root@$hostname
            '';
          }
        ];
      };
    };
}
