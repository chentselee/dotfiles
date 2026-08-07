return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter').install({
				'vim',
				'lua',
				'html',
				'css',
				'javascript',
				'typescript',
				'tsx',
				'go',
				'svelte',
				'c',
				'zig',
				'elixir',
				'eex',
				'heex',
				'jsdoc',
				'gitignore',
				'gitattributes',
				'json',
				'yaml',
				'toml',
				'markdown',
				'markdown_inline',
				'sql',
			})
		end,
	},
}
