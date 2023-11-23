return {
    "fatih/vim-go",
    build = function()
        vim.cmd [[ silent! GoInstallBinaries ]]
    end,
    options = {},
}
