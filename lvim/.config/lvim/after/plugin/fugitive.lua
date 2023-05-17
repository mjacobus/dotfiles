-- TODO: Setup the following mappings that won't overwrite lvim's
-- overwrite "Stage Hunk"
lvim.keys.normal_mode["<leader>gs"] = false
lvim.builtin.which_key.mappings["gs"] = '<cmd>Git<cr>'
lvim.builtin.which_key.mappings["gw"] = '<cmd>Git add %<cr>'
lvim.builtin.which_key.mappings["gbl"] = '<cmd>Git blame<cr>'

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = ThePrimeagen_Fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({ 'pull', '--rebase' })
    end, opts)

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
  end,
})
