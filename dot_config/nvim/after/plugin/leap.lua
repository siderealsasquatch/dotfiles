require("leap").set_default_keymaps(true)

require("leap").setup({
    case_sensitive = false,
    safe_labels = {} -- disable auto-jumping to the first match
})
