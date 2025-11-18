local function make_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    {
	"cryptomilk/nightcity.nvim",
	config = function()
	    vim.cmd.colorscheme "nightcity"
	    -- make_transparent()
	end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "nightcity",
	},
    },
}

