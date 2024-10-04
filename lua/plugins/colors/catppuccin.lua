return {
    'catppuccin/nvim',
    config=function() 
        require('catppuccin').setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
        })
    end,
    
}
