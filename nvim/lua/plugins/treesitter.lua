return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highligh = { enable = true },
	    indent = { enable = true },
	    autotage = { enable = true },
	    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "cpp", "css", "csv", "dockerfile", "gitignore", "gomod", "gosum", "go", "html", "http", "ini", "java", "javascript", "json", "jsdoc", "make", "nginx", "powershell", "python", "rust", "sql", "tsx", "typescript", "v", "xml", "yaml",
	    },
	    auto_install = false,
	})
    end
}

