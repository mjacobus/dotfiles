vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


vim.keymap.set("i", "jj", "<ESC>:w<cr>")
vim.keymap.set("n", "<leader>s", ":w<cr>")

vim.keymap.set("n", '<leader>j', function()
  name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    number = vim.api.nvim_buf_get_number(0)
    vim.api.nvim_exec('buffer #', true)
    vim.api.nvim_buf_delete(number, { force = true })
  end
end)

vim.keymap.set('n', '<leader>af', '<c-^>')

-- Missing mappings might be here:
-- ~/.dotfiles/neovim/.config/nvim/config.vim

vim.keymap.set('n', '<leader>bd', ':bd<cr>')
vim.keymap.set('n', '<leader>bdd', ':bd!<cr>')
vim.keymap.set('n', '<leader>bda', ':bufdo %bd!<cr>')
vim.keymap.set('n', '<leader>F', ':nohlsearch<cr>', { silent = true })

-- " Avoid arrow keys in command mode
vim.keymap.set('n', '<C-h>', '<left>')
vim.keymap.set('n', '<C-j>', '<down>')
vim.keymap.set('n', '<C-k>', '<up>')
vim.keymap.set('n', '<C-l>', '<right>')
vim.keymap.set('n', '<C-x>', '<del>')

vim.keymap.set('n', '<leader>ak', function()
  open_mj_alternative_file('next', '--exists')
end)

vim.keymap.set('n', '<leader>aj', function()
  open_mj_alternative_file('prev', '--exists')
end)


-- functions

function open_mj_alternative_file(subcommand, options)
  file_path = vim.fn.expand('%')
  file_path = vim.fn.fnamemodify(file_path, ":~:.")
  files = mj_alternative_file(file_path, subcommand, options)
  files = vim.split(files, ' ')
  file = files[1]

  if file ~= '' then
    vim.api.nvim_command('e ' .. file)
  end
end

function mj_alternative_file(file, subcommand, options)
  local cmd = 'mj alternative_file ' .. subcommand .. ' ' .. file .. ' ' .. options
  return execute_command(cmd)
end

function execute_command(cmd)
  print("cmd: " .. cmd)
  local f = io.popen(cmd)
  local s = f:read('*a')
  f:close()
  return s
end
