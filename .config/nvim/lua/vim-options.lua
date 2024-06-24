vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")

-- Set leader key
vim.g.mapleader = " "

-- Terminal toggle script
local te_buf = nil
local te_win_id = nil

local v = vim
local fun = v.fn
local cmd = v.api.nvim_command
local gotoid = fun.win_gotoid
local getid = fun.win_getid

-- Function to open terminal
local function openTerminal()
    if fun.bufexists(te_buf) ~= 1 then
        cmd("au TermOpen * setlocal nonumber norelativenumber signcolumn=no")
        cmd("sp | winc J | res 25 | te")
        te_win_id = getid()
        te_buf = fun.bufnr('%')
        -- Set the mapping to leave terminal mode
        cmd("tnoremap <Esc> <C-\\><C-n>")
    elseif gotoid(te_win_id) ~= 1 then
        cmd("sb " .. te_buf .. "| winc J | res 25")
        te_win_id = getid()
    end
    cmd("startinsert")
end

-- Function to hide terminal
local function hideTerminal()
    if gotoid(te_win_id) == 1 then
        cmd("hide")
    end
end

-- Function to toggle terminal
function ToggleTerminal()
    if gotoid(te_win_id) == 1 then
        hideTerminal()
    else
        openTerminal()
    end
end

-- Map the toggle function to a key, e.g., <leader>t
vim.api.nvim_set_keymap('n', '<leader>t', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })

