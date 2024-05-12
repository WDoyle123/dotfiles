return {
  "navarasu/onedark.nvim",
  name = "onedark",
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'cool' -- available styles: dark, darker, cool, deep, warm, warmer, light
    }
    require('onedark').load()
    vim.cmd.colorscheme "onedark"
  end
}

