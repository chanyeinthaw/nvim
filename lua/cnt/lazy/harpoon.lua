return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})
			harpoon_remaps(harpoon)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
