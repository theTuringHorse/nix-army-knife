return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false, -- off by default, toggle with <leader>um
    },
  },
  {
    -- use our markdownlint config (disables MD013 line-length)
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "-" },
        },
      },
    },
  },
}
