return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config= function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                mode = "buffer",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        text_align = "center",
                        separator = false,
                    },
                },
            },
        }
    end,
}
