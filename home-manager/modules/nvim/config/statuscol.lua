local builtin = require("statuscol.builtin")

local sev = vim.diagnostic.severity

vim.diagnostic.config({
            severity_sort = true,
            signs = {
              text = {
                [sev.WARN] = "",
                [sev.ERROR] = "",
                [sev.INFO] = "",
                [sev.HINT] = "",
              },
            },
          })  ;

require("statuscol").setup({
  -- configuration goes here, for example:
  --
  -- relculright = true,

  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    {
      sign = { namespace = { "diagnostic/signs" }, maxwidth = 1 },
      click = "v:lua.ScSa"
    },
    {
      sign = { namespace = { "gitsigns" }, maxwidth = 1 },
      click = "v:lua.ScSa"
    },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa", },
    -- {
    --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true },
    --   click = "v:lua.ScSa"
    -- },
  }
})
