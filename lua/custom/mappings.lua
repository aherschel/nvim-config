local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar",
    }
  }
}

M.rustaceanvim = {
  plugin = true,
  n = {
    ["<A-j>"] = {
      function ()
        vim.cmd.RustLsp { 'hover', 'actions' };
      end,
      "Rust Hover",
    },
    ["<leader>rt"] = {
      function ()
        vim.cmd.RustLsp { 'testables', bang = true };
      end,
      "Run Rust Tests"
    },
  }
}


M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Add if err != nil"
    },
  }
}

return M
