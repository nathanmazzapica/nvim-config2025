vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<leader>ph", vim.cmd.help)

vim.keymap.set("n", "<leader>phs", function()
    local search_term = vim.fn.input("Search: ")
    vim.cmd.help({ args = {search_term} })
end)

vim.keymap.set("n", "<leader>phv", function()
    local search_term = vim.fn.input("Search: ")
    vim.cmd.help({ args = {search_term} })
end)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local job_id = 0
vim.keymap.set("n", "<leader>to", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)

    job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>tt", "<cmd>Floaterminal<CR>")

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
    current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<leader>tr", function()
    if current_command == "" then
        current_command = vim.fn.input("Command: ")
    end

    vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)
