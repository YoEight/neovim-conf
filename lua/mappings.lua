vim.g.mapleader = " "

local vimp = require('vimp')

-- telescope
local telescope = require('telescope.builtin')
vimp.nnoremap('<leader>ff', telescope.find_files)
vimp.nnoremap('<leader>fg', telescope.git_files)
vimp.nnoremap('<leader>fb', telescope.buffers)
vimp.nnoremap('<leader>fh', telescope.help_tags)
vimp.nnoremap('<leader>fcr', telescope.lsp_references)
vimp.nnoremap('<leader>fcs', telescope.lsp_workspace_symbols)
vimp.nnoremap('<leader>fcd', telescope.lsp_workspace_diagnostics)
vimp.nnoremap('<leader>ft', telescope.treesitter)

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    vimp.nnoremap({'silent'}, 'K', vim.lsp.buf.hover)
    vimp.nnoremap({'silent'}, 'gd', vim.lsp.buf.definition)
    vimp.nnoremap({'silent'}, '<leader>ca', vim.lsp.buf.code_action)
    vimp.nnoremap({'silent'}, '<leader>cr', vim.lsp.buf.rename)
end

local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end
