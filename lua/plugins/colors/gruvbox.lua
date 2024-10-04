return {
    { 'morhetz/gruvbox' }, -- original gruvbox
    {
          'sainnhe/gruvbox-material', -- gruvbox material
          config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = true
          end
    },
}
