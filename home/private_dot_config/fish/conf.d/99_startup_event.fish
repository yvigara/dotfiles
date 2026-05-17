# Emit fish_startup once on the first prompt.
# Keybindings and other once-per-session init register --on-event fish_startup.
function __emit_startup --on-event fish_prompt
    functions -e (status current-function)
    emit fish_startup
end
