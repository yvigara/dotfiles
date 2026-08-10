# Keep failed commands in history; purge only "command not found" (exit 127).
# Sponge's default `sponge_filter_failed` drops every non-zero-exit command;
# swap it for a narrower filter. https://github.com/meaningful-ooo/sponge

function sponge_filter_command_not_found --argument-names cmd exit_code previously_in_history \
    --description 'sponge: purge only command-not-found (exit 127) from history'
    test "$exit_code" -eq 127
end

# Replace the blanket failed-command filter with ours; keep the regex filter
# so `sponge_regex_patterns` still works.
set -g sponge_filters sponge_filter_command_not_found sponge_filter_matched
