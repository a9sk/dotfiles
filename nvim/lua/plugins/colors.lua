local function make_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
    -- {
	-- "cryptomilk/nightcity.nvim",
	-- config = function()
	--    vim.cmd.colorscheme "nightcity"
	--    -- make_transparent()
	-- end
    -- },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "nightcity",
	},
    },

	{
  	'projekt0n/github-nvim-theme',
  	name = 'github-theme',
  	lazy = false, -- make sure we load this during startup if it is your main colorscheme
  	priority = 1000, -- make sure to load this before all the other start plugins
  	config = function()
		vim.cmd('colorscheme github_dark')
  	end,
	},

}

