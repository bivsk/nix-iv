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
            name = "fsync";
            help = "Update flake.lock";
            command = ''
              echo "=> Updating flake inputs"
              nix flake update

	      pushd $PRJ_ROOT
              git add flake.lock
              git commit -m "chore: update flake.lock"
              git push
	      popd
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
