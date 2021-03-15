vim.cmd [[packadd packer.nvim]]

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile ]])

return require('packer').startup(function(use)
  use {"wbthomason/packer.nvim", opt = true}

  -- colorscheme
  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  use {
    "hoob3rt/lualine.nvim",
    config = function()
    require("modules.statusline")
    end,
  }

end)
