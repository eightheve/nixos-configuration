-- local lsp = require("lspconfig")

-- LSP servers from nixCats runtime deps
-- lsp.lua_ls.setup({})
-- lsp.nixd.setup({})
-- lsp.clojure_lsp.setup({})

vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("clojure_lsp")

-- global LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local buf = ev.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf })
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = buf })
  end,
})

