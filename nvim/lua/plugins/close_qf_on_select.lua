return {
  "AstroNvim/astrocore",
  opts = {
    autocmds = {
      close_quickfix_on_select = {
        {
          event = "FileType",
          pattern = "qf",
          callback = function(args)
            vim.keymap.set("n", "<CR>", function()
              local wininfo = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]
              local is_location_list = wininfo and wininfo.loclist == 1

              if is_location_list then
                vim.cmd(".ll")
                vim.cmd("lclose")
              else
                vim.cmd(".cc")
                vim.cmd("cclose")
              end
            end, {
              buffer = args.buf,
              silent = true,
              desc = "Open entry and close quickfix",
            })
          end,
        },
      },
    },
  },
}
