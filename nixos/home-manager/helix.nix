{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "monokai_transparent";

      editor = {
        line-number = "relative";
        bufferline = "always";
        text-width = 200;

        statusline = {
        left = ["mode" "spinner" "separator"];
        center = ["file-name" "read-only-indicator" "file-modification-indicator" "total-line-numbers"];
        right = ["separator" "diagnostics" "selections" "register" "position" "file-encoding"];
      };

      file-picker.hidden = true;

      indent-guides.render = true;

      soft-wrap = {
        enable = true;
        max-wrap = 25;
        max-indent-retain = 20;
        wrap-at-text-width = true;
      };         
    };
  };

  themes = {
    "monokai_transparent" = {
      "inherits" = "monokai_pro";
      "ui.background" = { };
    };
  };

  languages = with pkgs; {
    language-server = {

      typescript-language-server = {
        command = "${nodePackages.typescript-language-server}/bin/typescript-language-server";
        config.documentFormatting = false;
      };

      nil = {
        command = "${nil}/bin/nil";
        config.nil = {
          formatting.command = [ "${nixpkgs-fmt}/bin/nixpkgs-fmt" ];
          nix.flake.autoEvalInputs = true;
        };
      };

      pylsp.command = "${python3Packages.python-lsp-server}/bin/pylsp";

      ltex-ls.command = "${ltex-ls}/bin/ltex-ls";

      r.command = "${R}/bin/R";

      nimlangserver.command = "${nimlangserver}/bin/nimlangserver";
    };

    language =
      let
        jsTsWebLanguageServers = [
          "typescript-language-server" 
        ];
      in [ 
        { 
          name = "typescript"; 
          language-servers = jsTsWebLanguageServers; 
        }

        { 
          name = "javascript"; 
          language-servers = jsTsWebLanguageServers; 
        }

        { 
          name = "jsx"; 
          language-servers = jsTsWebLanguageServers; 
        }

        { 
          name = "tsx"; 
          language-servers = jsTsWebLanguageServers; 
        }

        { 
          name = "sql"; 
          formatter.command = "pg_format"; 
        }

        { 
          name = "json"; 
          language-servers = [
            { 
              name = "vscode-json-language-server"; 
              except-features = [ "format" ]; 
            } 
            "efm-lsp-prettier"
          ]; 
        }

        { 
          name = "markdown"; 
          language-servers = [
            { 
              name = "marksman"; 
              except-features = [ "format" ]; 
            }
            "ltex-ls" 
            "efm-lsp-prettier"
          ]; 
        }

        {
          name = "xml";
          file-types = [ "xml" ];
          formatter = {
            command = "${pkgs.yq-go}/bin/yq";
            args = [ "--input-format" "xml" "--output-format" "xml" "--indent" "2" ];
          };
        }
      ];
    };
  };    
}
