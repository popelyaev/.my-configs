return {
   "norcalli/nvim-colorizer.lua",
   config = function()
      require("colorizer").setup({
         css = { rgb_fn = true, }, -- подсветка rgb()/rgba()
         scss = { rgb_fn = true, }, -- подсветка rgb()/rgba()
         html = { names = true, }, -- названия цветов ("red")
      })
   end
}
