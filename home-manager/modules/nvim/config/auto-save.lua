require("auto-save").setup({
    debounce_delay = 500,
    callbacks = {
        before_saving = function() vim.g.is_autosave = true end,
        after_saving = function() vim.g.is_autosave = false end,
    }
})
