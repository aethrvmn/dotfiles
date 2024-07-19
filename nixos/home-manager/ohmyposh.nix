{ config, ... } :

{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "console_title_template" = "{{ .Shell }} in {{ .Folder }}";
      "final_space" = true;
      "version" = 2;
      "blocks" = [
        {
          "alignment" = "left";
          "newline" = true;
          "type" = "prompt";
          "segments" = [
            {
              "template" = "{{ .Icon }} ";
              "type" = "os";
            }
            {
              "background" = "transparent";
              "foreground" = "#bebcae";
              "style" = "plain";
              "template" = " {{ .Path }}";
              "type" = "path";
              "properties" = {
                "style" = "full";
              };
            }
            {
              "background" = "transparent";
              "foreground" = "white";
              "style" = "plain";
              "template" = " {{ if .UpstreamURL }}{{ url .UpstreamIcon .UpstreamURL }}{{ end }}{{ .HEAD }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }} ";
              "type" = "git";
              "properties" = {
                "branch_max_length" = 25;
                "fetch_status" = true;
                "fetch_upstream_icon" = true;
              };
            }
          ];
        }
        {
          "overflow" = "hidden";
          "type" = "rprompt";
          "segments" = [
            {
              "duration" = 0;
              "namelength" = 0;
              "text" = "";
              "background" = "transparent";
              "foreground" = "white";
              "style" = "plain";
              "template" = " ";
              "type" = "node";
              "properties" = {
                "display_mode" = "files";
                "fetch_package_manager" = false;
                "home_enabled" = false;
              };
            }
            {
              "duration" = 0;
              "namelength" = 0;
              "text" = "";
              "background" = "transparent";
              "foreground" = "white";
              "style" = "plain";
              "template" = " ";
              "type" = "go";
              "properties" = {
                "fetch_version" = false;
              };
            }
            {
              "background" = "transparent";
              "foreground" = "white";
              "style" = "plain";
              "template" = " {{ .Venv }}";
              "type" = "python";
              "properties" = {
                "display_mode" = "files";
                "fetch_version" = false;
                "fetch_virtual_env" = true;
              };
            }
            {
              "background" = "transparent";
              "foreground" = "red";
              "style" = "plain";
              "template" = "{{ if .Error }} ✗ {{ end }}";
              "type" = "status";
            }
            {
              "background" = "transparent";
              "foreground" = "#ac966d";
              "style" = "plain";
              "type" = "executiontime";
            }
          ];
        }
        {
          "alignment" = "left";
          "newline" = true;
          "type" = "prompt";
          "segments" = [
            {
              "background" = "transparent";
              "foreground" = "#ac966d";
              "style" = "plain";
              "template" = "❯";
              "type" = "text";
            }
          ];
        }
      ];
      "transient_prompt" = {
        "background" = "transparent";
        "foreground" = "white";
        "template" = "❯ ";
          };
    };
  };
}
