-- Empties all vim registers

vim.api.nvim_create_user_command("DeleteRegisters", function()
	local regs = vim.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', "")
	for _, r in ipairs(regs) do
		vim.fn.setreg(r, {})
	end
end, {})
