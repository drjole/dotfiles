vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("my.highlight_on_yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- local debounce_timer = nil
-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--     group = vim.api.nvim_create_augroup("my.autosave", { clear = true }),
--     pattern = "*.erb",
--     callback = function()
--         if debounce_timer then
--             debounce_timer:stop()
--             debounce_timer:close()
--         end
--
--         debounce_timer = vim.uv.new_timer()
--         if debounce_timer then
--             debounce_timer:start(200, 0, vim.schedule_wrap(function()
--                 if vim.bo.modified then
--                     vim.cmd("silent! noautocmd write")
--                 end
--             end))
--         end
--     end,
-- })
