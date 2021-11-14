local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        -- Companion to help writing my vim configuration scripts.
        use 'svermeulen/vimpeccable'
        use 'rafcamlet/nvim-luapad'

        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

        use 'wsdjeg/luarefvim'
        use 'euclidianAce/BetterLua.vim'
        use 'neovim/nvim-lspconfig'

        use 'ntpeters/vim-better-whitespace'

        -- colorschemes
        use 'tomasiser/vim-code-dark'

        if packer_bootstrap then
            require('packer').sync()
        end
    end
)
