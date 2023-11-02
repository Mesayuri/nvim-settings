local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup()

-- 警告・エラーメッセージ設定
vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- 各言語にアタッチされる設定
local on_attach = function(client, bufnr)
  -- デフォルトのキーバインドを設定 --
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.inplementation()<CR>")
  vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  vim.keymap.set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  vim.keymap.set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")

  -- LSPが持つフォーマット機能を無効化する --
  -- 例えばtsserverはデフォルトでフォーマット機能を提供するが、利用したくない場合は次の行のコメントアウトを解除する
  --client.server_capabilities.documentFormattingProvider = false
end

-- 補完プラグインであるcmp_nvim_lspをLSPと連携する
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
    function (server_name)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
}
