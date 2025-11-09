{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
    nixd
    nil
  ];

  programs.zed-editor = {
    enable = true;
    themes = {
      madoka-wp = {
        name = "Madoka";
        author = "eightheve";
        themes = [
          {
            name = "Madoka Dark";
            appearance = "dark";
            style = {
              border = "#5f6368ff";
              "border.variant" = "#21262dff";
              "border.focused" = null;
              "border.selected" = null;
              "border.transparent" = null;
              "border.disabled" = null;
              "elevated_surface.background" = "#21262d";
              "surface.background" = "#${config.colorScheme.palette.base01}";
              background = "#${config.colorScheme.palette.base01}";
              element = {
                background = "#${config.colorScheme.palette.base01}";
                hover = "#21262d88";
                active = "#3f434a88";
                selected = "#3f434a88";
                disabled = "#5f6368d3";
              };
              ghost_element = {
                background = "#${config.colorScheme.palette.base01}";
                hover = "#21262dff";
                active = "#3f434aff";
                selected = "#3f434aff";
                disabled = "#5f6368d3";
              };
              "drop_target.background" = "#5f6368d3";
              text = "#a6a8aa";
              "text.muted" = "#9b9da0";
              "text.placeholder" = "#5f6368";
              "text.disabled" = "#5f6368";
              "text.accent" = "#${config.colorScheme.palette.base08}";
              icon = "#a6a8aa";
              "icon.muted" = "#5f6368";
              "icon.disabled" = "#5f6368";
              "icon.placeholder" = "#5f6368";
              "icon.accent" = "#${config.colorScheme.palette.base08}";
              "status_bar.background" = "#${config.colorScheme.palette.base01}";
              "title_bar.background" = "#${config.colorScheme.palette.base01}";
              "title_bar.inactive_background" = "#${config.colorScheme.palette.base01}";
              "toolbar.background" = "#${config.colorScheme.palette.base01}";
              "tab_bar.background" = "#${config.colorScheme.palette.base01}";
              "tab.inactive_background" = "#${config.colorScheme.palette.base01}";
              "tab.active_background" = "#21262d";
              "search.match_background" = "#3f434a";
              "panel.background" = "#${config.colorScheme.palette.base01}";
              "panel.focused_border" = null;
              "pane.focused_border" = "#${config.colorScheme.palette.base01}";
              "scrollbar.thumb.background" = "#21262dd3";
              "scrollbar.thumb.hover_background" = "#3f434a";
              "scrollbar.thumb.border" = "#00000000";
              "scrollbar.track.background" = "#00000000";
              "scrollbar.track.border" = "#00000000";
              "editor.foreground" = "#a6a8aa";
              "editor.background" = "#${config.colorScheme.palette.base01}";
              "editor.gutter.background" = "#${config.colorScheme.palette.base01}";
              "editor.subheader.background" = "#${config.colorScheme.palette.base01}";
              "editor.active_line.background" = "#21262d";
              "editor.highlighted_line.background" = "#3f434a";
              "editor.line_number" = "#5f6368";
              "editor.active_line_number" = "#a6a8aa";
              "editor.invisible" = "#5f6368";
              "editor.wrap_guide" = "#5f6368";
              "editor.active_wrap_guide" = "#5f6368d3";
              "editor.document_highlight.read_background" = "#3f434ad3";
              "editor.document_highlight.write_background" = "#5f6368d3";
              "link_text.hover" = "#${config.colorScheme.palette.base08}";

              conflict = "#${config.colorScheme.palette.base0C}";
              "conflict.background" = "#${config.colorScheme.palette.base0C}d3";
              "conflict.border" = "#5f6368";

              created = "#${config.colorScheme.palette.base0C}";
              "created.background" = "#${config.colorScheme.palette.base0C}d3";
              "created.border" = "#5f6368";

              deleted = "#${config.colorScheme.palette.base02}";
              "deleted.background" = "#${config.colorScheme.palette.base02}d3";
              "deleted.border" = "#5f6368";

              error = "#${config.colorScheme.palette.base02}";
              "error.background" = "#${config.colorScheme.palette.base02}d3";
              "error.border" = "#5f6368";

              hidden = "#5f6368";
              "hidden.background" = "#${config.colorScheme.palette.base01}";
              "hidden.border" = "#5f6368";

              hint = "#${config.colorScheme.palette.base08}";
              "hint.background" = "#${config.colorScheme.palette.base08}d3";
              "hint.border" = "#5f6368";

              ignored = "#5f6368";
              "ignored.background" = "#${config.colorScheme.palette.base01}";
              "ignored.border" = "#5f6368";

              info = "#${config.colorScheme.palette.base08}";
              "info.background" = "#${config.colorScheme.palette.base08}d3";
              "info.border" = "#5f6368";

              modified = "#${config.colorScheme.palette.base06}";
              "modified.background" = "#${config.colorScheme.palette.base06}d3";
              "modified.border" = "#5f6368";

              predictive = "#${config.colorScheme.palette.base09}";
              "predictive.background" = "#${config.colorScheme.palette.base09}d3";
              "predictive.border" = "#5f6368";

              renamed = "#${config.colorScheme.palette.base08}";
              "renamed.background" = "#${config.colorScheme.palette.base08}d3";
              "renamed.border" = "#5f6368";

              success = "#${config.colorScheme.palette.base04}";
              "success.background" = "#${config.colorScheme.palette.base04}d3";
              "success.border" = "#5f6368";

              unreachable = "#5f6368";
              "unreachable.background" = "#${config.colorScheme.palette.base01}";
              "unreachable.border" = "#5f6368";

              warning = "#${config.colorScheme.palette.base06}";
              "warning.background" = "#${config.colorScheme.palette.base06}d3";
              "warning.border" = "#5f6368";

              players = [
                {
                  cursor = "#${config.colorScheme.palette.base04}";
                  background = "#${config.colorScheme.palette.base04}20";
                  selection = "#${config.colorScheme.palette.base04}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base02}";
                  background = "#${config.colorScheme.palette.base02}20";
                  selection = "#${config.colorScheme.palette.base02}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base06}";
                  background = "#${config.colorScheme.palette.base06}20";
                  selection = "#${config.colorScheme.palette.base06}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base08}";
                  background = "#${config.colorScheme.palette.base08}20";
                  selection = "#${config.colorScheme.palette.base08}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base0A}";
                  background = "#${config.colorScheme.palette.base0A}20";
                  selection = "#${config.colorScheme.palette.base0A}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base0C}";
                  background = "#${config.colorScheme.palette.base0C}20";
                  selection = "#${config.colorScheme.palette.base0C}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base0D}";
                  background = "#${config.colorScheme.palette.base0D}20";
                  selection = "#${config.colorScheme.palette.base0D}30";
                }
                {
                  cursor = "#${config.colorScheme.palette.base0B}";
                  background = "#${config.colorScheme.palette.base0B}20";
                  selection = "#${config.colorScheme.palette.base0B}30";
                }
              ];

              syntax = {
                attribute = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = null;
                  font_weight = null;
                };
                boolean = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = null;
                  font_weight = null;
                };
                comment = {
                  color = "#5f6368";
                  font_style = "italic";
                  font_weight = null;
                };
                "comment.doc" = {
                  color = "#5f6368";
                  font_style = "italic";
                  font_weight = 700;
                };
                constant = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = null;
                  font_weight = null;
                };
                constructor = {
                  color = "#${config.colorScheme.palette.base04}";
                  font_style = null;
                  font_weight = null;
                };
                directive = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = null;
                  font_weight = null;
                };
                escape = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = "italic";
                  font_weight = null;
                };
                function = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = "italic";
                  font_weight = null;
                };
                "function.decorator" = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = "italic";
                  font_weight = null;
                };
                "function.magic" = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = "italic";
                  font_weight = null;
                };
                keyword = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = "italic";
                  font_weight = null;
                };
                label = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                local = {
                  color = "#${config.colorScheme.palette.base0A}";
                  font_style = null;
                  font_weight = null;
                };
                markup = {
                  color = "#${config.colorScheme.palette.base0D}";
                  font_style = null;
                  font_weight = null;
                };
                meta = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                modifier = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                namespace = {
                  color = "#${config.colorScheme.palette.base0A}";
                  font_style = null;
                  font_weight = null;
                };
                number = {
                  color = "#${config.colorScheme.palette.base0B}";
                  font_style = null;
                  font_weight = null;
                };
                operator = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = null;
                  font_weight = null;
                };
                parameter = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                punctuation = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                regexp = {
                  color = "#86b0be";
                  font_style = null;
                  font_weight = null;
                };
                self = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = 700;
                };
                string = {
                  color = "#${config.colorScheme.palette.base05}";
                  font_style = null;
                  font_weight = null;
                };
                strong = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = null;
                  font_weight = 700;
                };
                support = {
                  color = "#${config.colorScheme.palette.base09}";
                  font_style = null;
                  font_weight = null;
                };
                symbol = {
                  color = "#${config.colorScheme.palette.base06}";
                  font_style = null;
                  font_weight = null;
                };
                tag = {
                  color = "#${config.colorScheme.palette.base08}";
                  font_style = null;
                  font_weight = null;
                };
                text = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
                type = {
                  color = "#${config.colorScheme.palette.base04}";
                  font_style = null;
                  font_weight = null;
                };
                variable = {
                  color = "#a6a8aa";
                  font_style = null;
                  font_weight = null;
                };
              };

              "terminal.background" = "#${config.colorScheme.palette.base01}ff";
              "terminal.foreground" = "#${config.colorScheme.palette.base0E}ff";

              "terminal.ansi.black" = "#${config.colorScheme.palette.base01}ff";
              "terminal.ansi.red" = "#${config.colorScheme.palette.base03}ff";
              "terminal.ansi.green" = "#${config.colorScheme.palette.base05}ff";
              "terminal.ansi.yellow" = "#${config.colorScheme.palette.base07}ff";
              "terminal.ansi.blue" = "#${config.colorScheme.palette.base09}ff";
              "terminal.ansi.magenta" = "#${config.colorScheme.palette.base0B}ff";
              "terminal.ansi.cyan" = "#${config.colorScheme.palette.base0D}ff";
              "terminal.ansi.white" = "#${config.colorScheme.palette.base0F}ff";

              "terminal.ansi.bright_black" = "#${config.colorScheme.palette.base00}ff";
              "terminal.ansi.bright_red" = "#${config.colorScheme.palette.base02}ff";
              "terminal.ansi.bright_green" = "#${config.colorScheme.palette.base04}ff";
              "terminal.ansi.bright_yellow" = "#${config.colorScheme.palette.base06}ff";
              "terminal.ansi.bright_blue" = "#${config.colorScheme.palette.base08}ff";
              "terminal.ansi.bright_magenta" = "#${config.colorScheme.palette.base0A}ff";
              "terminal.ansi.bright_cyan" = "#${config.colorScheme.palette.base0C}ff";
              "terminal.ansi.bright_white" = "#${config.colorScheme.palette.base0E}ff";
            };
          }
        ];
      };
    };
  };
}
