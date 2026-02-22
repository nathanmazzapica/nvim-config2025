local function get_visual_text()
    local s                     = vim.fn.getpos("'<")
    local e                     = vim.fn.getpos("'>")

    local line_start, col_start = s[2], s[3]
    local line_end, col_end     = e[2], e[3]

    -- Normalize reversed selection
    if line_start > line_end or (line_start == line_end and col_start > col_end) then
        line_start, line_end = line_end, line_start
        col_start, col_end = col_end, col_start
    end

    -- Only handling same-line text (what you're doing)
    if line_start ~= line_end then
        return nil
    end

    -- Get the line safely
    local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_start, false)
    local line = lines[1]
    if not line then
        return nil
    end

    -- Clip columns to line length (Neovim often reports col_end one past actual)
    local line_len = #line
    if col_start < 1 then col_start = 1 end
    if col_end > line_len then col_end = line_len end

    return line:sub(col_start, col_end)
end

vim.keymap.set("v", "<leader>pht", function()
    -- exit visual mode so '< and '> update
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    vim.schedule(function()
        local text = get_visual_text()
        if not text or text == "" then return end
        vim.cmd("help " .. text)
    end)
end, { silent = true })
