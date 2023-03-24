function ColorMyPencils(color) 
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


-- ColorMyPencils()
-- ColorMyPencils("base16-monokai")
ColorMyPencils("catppuccin-mocha")
-- ColorMyPencils("base16-tomorrow-night")
-- ColorMyPencils("rose-pine")
-- ColorMyPencils("OceanNext")
-- ColorMyPencils("noctis")
-- ColorMyPencils("neogruvbox")
-- ColorMyPencils("bloop")
-- ColorMyPencils("darkscene")
