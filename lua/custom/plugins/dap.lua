return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'jedrzejboczar/nvim-dap-cortex-debug',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dap_ui_widgets = require 'dap.ui.widgets'

    vim.keymap.set('n', '<leader>gb', dap.toggle_breakpoint, { desc = '[GB] set breakpoint' })
    vim.keymap.set('n', '<leader>gc', dap.continue, { desc = '[GC] continue' })
    vim.keymap.set('n', '<leader>gs', dap.step_into, { desc = '[GS] step into' })
    vim.keymap.set('n', '<leader>gn', dap.step_over, { desc = '[GN] step over' })
    vim.keymap.set('n', '<leader>gf', dap.step_out, { desc = '[GF] step out' })
    vim.keymap.set('n', '<leader>gr', dap.restart, { desc = '[GR] restart' })
    vim.keymap.set('n', '<leader>gq', dap.close, { desc = '[GQ] close' })
    vim.keymap.set('n', '<leader>gx', dap.terminate, { desc = '[GX] terminate' })
    vim.keymap.set('n', '<leader>gi', dap.run_to_cursor, { desc = '[GI] run to cursor' })

    -- vim.keymap.set('n', '<leader>gh', dap_ui_widgets.hover, { desc = '[GH] hover' })
    vim.keymap.set('n', '<leader>gp', dap_ui_widgets.preview, { desc = '[GP] preview' })

    local dapui = require 'dapui'
    vim.keymap.set('n', '<leader>go', dapui.toggle, { desc = '[GO] open dap ui' })

    vim.keymap.set('n', '<leader>gg', '<cmd>Telescope dap commands<cr>', { desc = '[GG] dap commands list' })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    dap.listeners.after.terminate.dapui_config = function()
      dapui.close()
    end

    local cortex_debug = require 'dap-cortex-debug'
    cortex_debug.setup {
      debug = false, -- log debug messages
      -- path to cortex-debug extension, supports vim.fn.glob
      -- by default tries to guess: mason.nvim or VSCode extensions
      extension_path = nil,
      lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
      node_path = 'node', -- path to node.js executable
      dapui_rtt = true, -- register nvim-dap-ui RTT element
      -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
      dap_vscode_filetypes = { 'c', 'cpp' },
    }

    -- hardcoded for rpi pico TODO: workout workspace dependent settings
    dap.configurations.c = {
      cortex_debug.openocd_config {
        name = 'pico',
        cwd = '${workspaceFolder}',
        executable = '${workspaceFolder}/build/app.elf',
        configFiles = { 'interface/cmsis-dap.cfg', 'target/rp2040.cfg' },
        openOCDLaunchCommands = { 'adapter speed 5000' },
        gdbTarget = 'localhost:3333',
        rttConfig = cortex_debug.rtt_config(0),
        showDevDebugOutput = false,
        auto_continue_if_many_stopped = false,
      },
    }

    require('dapui').setup()
    -- require('dapui').setup {
    --   layouts = {
    --     {
    --       position = 'left',
    --       size = 96,
    --       elements = {
    --         { id = 'scope', size = 0.4 },
    --         { id = 'rtt', size = 0.6 }
    --       }
    --     },
    --   },

    -- run workspace config file
    -- vim.api.nvim_create_autocmd('DirChanged', {
    --   group = vim.api.nvim_create_augroup('dap cwd change', { clear = true }),
    --   pattern = 'global',
    --   desc = 'autocommand to load workspace dap config',
    --   callback = function(event)
    --     local dap_config = vim.fn.findfile('.nvim_dap_cfg.lua', vim.uv.cwd())
    --     if dap_config ~= '' and dap_config ~= nil then
    --       dofile(dap_config)
    --     end
    --   end,
    -- })

    -- NOTE: SIGNS:
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'ErrorMsg', linegl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'ErrorMsg', linegl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'ErrorMsg', linegl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '=>', texthl = 'Character', linegl = '', numhl = '' })
    vim.fn.sign_define('DapBrekpointRejected', { text = '', texthl = 'Statement', linegl = '', numhl = '' })
  end,
}
