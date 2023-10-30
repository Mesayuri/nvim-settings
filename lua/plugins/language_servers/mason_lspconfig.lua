local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup()

local on_attach = function(client, bufnr)
  -- LSPが持つフォーマット機能を無効化する --
  -- 例えばtsserverはデフォルトでフォーマット機能を提供するが、利用したくない場合は次の行のコメントアウトを解除する
  --client.server_capabilities.documentFormattingProvider = false

  -- デフォルトのキーバインドを設定 --
  local set = vim.keymap.set
  set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

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