return {
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {
        floating_window = true,
        toggle_key = "<M-x>",
        -- fix_pos = true,
        select_signature_key = "<M-n>",
      }
    end,
  },
}
