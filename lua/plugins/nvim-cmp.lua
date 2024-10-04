return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
	},
	config = function()
        local cmp = require('cmp')
        
        -- Autopairs https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo        
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')        
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )

			
		
	end,
}
