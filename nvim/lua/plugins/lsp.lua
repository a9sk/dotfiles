return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "rust_analyzer",
          "clangd",
          "dockerls",
          "docker_compose_language_service",
          "yamlls",
          "jsonls",
          "ts_ls",
          "bashls",
        },
        automatic_enable = true,  -- this calls vim.lsp.enable for installed servers :contentReference[oaicite:0]{index=0}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLSPKeymaps", {}),
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = { 
	    gopls = { 
		semanticTokens = true,

		semanticTokenTypes = {

		    namespace = true,
		    type = true,
		    variable = true,
		    -- etc.
		},
		usePlaceholders = true,
		analyses = {
		    unusedparams = true,
		},
		staticcheck = true,
		gofumpt = true,
	    },
	}
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      })


      vim.lsp.config("clangd", {
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })


      vim.lsp.config("dockerls", {
        capabilities = capabilities,
        filetypes = { "dockerfile" },
      })


      vim.lsp.config("docker_compose_language_service", {
        capabilities = capabilities,
        filetypes = { "yaml", "yml" },
      })


      vim.lsp.config("yamlls", {
        capabilities = capabilities,
      })


      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })


      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })


      vim.lsp.config("bashls", {
        capabilities = capabilities,
        filetypes = { "sh", "bash" },
      })

      -- eable all Mason installed LSPs
      -- this uses vim.lsp.enable() to start them when appropriate :contentReference[oaicite:1]{index=1}
      local mason_lspconfig = require("mason-lspconfig")
      local installed = mason_lspconfig.get_installed_servers()
      vim.lsp.enable(installed)
      
    end,
  },
}

