require("auto-save").setup({
    debounce_delay = 500,
    condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- telescope prompt autosave just creates irritating messages
        if utils.not_in(fn.getbufvar(buf, "&filetype"), { "TelescopePrompt" }) then
            return true -- met condition(s), can save
        end
        return false    -- can't save
    end,
})
