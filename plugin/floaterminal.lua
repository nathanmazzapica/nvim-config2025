vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    opts = opts or {}

    -- editor size
    local ui = vim.api.nvim_list_uis()[1]
    local total_width = ui.width
    local total_height = ui.height

    -- resolve window size
    local win_width = opts.width or math.floor(total_width * 0.8)
    local win_height = opts.height or math.floor(total_height * 0.8)

    -- center position
    local col = math.floor((total_width - win_width) / 2)
    local row = math.floor((total_height - win_height) / 2)

    -- create scratch buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end


    -- create window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    return { buf = buf, win = win }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end




vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
