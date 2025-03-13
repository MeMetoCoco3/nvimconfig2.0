return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        "icon",
      },
      keymaps = {
        ["-"] = "actions.close",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  }
}
