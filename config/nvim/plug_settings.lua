-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   plug_settings.lua                                  :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: wsz </var/spool/mail/wsz>                  +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2022/02/26 22:26:26 by wsz               #+#    #+#             --
--   Updated: 2022/02/26 22:26:30 by wsz              ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

require('scnvim').setup()



-- #########################
-- ### FILETYPE.NVIM
-- ##########################

vim.g.did_load_filetypes = 1


-- ##########################
-- ### NUMB
-- ##########################

require('numb').setup()

-- ##########################
-- ### TOGGLETERM
-- ##########################

require("toggleterm").setup{
	open_mapping = [[<c-\>]],
	--on_open = fun(t: Terminal), -- function to run when the terminal opens
	--on_close = fun(t: Terminal), -- function to run when the terminal closes
	--on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
	--on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
	--on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
	hide_numbers = false,
	shade_terminals = true,
	shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = 'shadow',
		--width = 30,
		--height = 30,
		winblend = 3,
		highlights = {
			--border = "Normal",
			--background = "Normal",
		}
	}
}
function _G.set_terminal_keymaps()
	local opts = {noremap = true}
	vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

---- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


-- ##########################
-- ### BUFFERLINE
-- ##########################

require'bufferline'.setup{
	highlights = {
		fill = {
			guifg = '#fabd2f',
			guibg = '#191d20',
		},
	},
	options = {
		diagnostics             = "coc",
		show_buffer_icons       = false,
		show_close_icon         = false,
		show_buffer_close_icons = false,
		show_tab_indicators     = false,
		separator_style         = {"", ""},
		indicator_icon          = '',
		buffer_close_icon       = '',
		modified_icon           = '●',
		close_icon              = '',
		left_trunc_marker       = '',
		right_trunc_marker      = '',

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and "  " or "  "
			return " " .. count .. icon
		end,
		offsets = {
			{
				filetype   = "neo-tree",
				text       = "",
				text_align = "left"
			}
		}
	}
}

-- ##########################
-- ### NEO SCROLL
-- ##########################

require('neoscroll').setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings             = {'<C-u>', '<C-b>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
	hide_cursor          = true,  -- Hide cursor while scrolling
	stop_eof             = true,  -- Stop at <EOF> when scrolling downwards
	use_local_scrolloff  = false, -- Use the local scope of scrolloff instead of the global scope
	respect_scrolloff    = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true,  -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function      = nil,   -- Default easing function
	pre_hook             = nil,   -- Function to run before the scrolling animation starts
	post_hook            = nil,   -- Function to run after the scrolling animation ends
	performance_mode     = false, -- Disable "Performance Mode" on all buffers.
})
local t = {} -- Syntax: t[keys] = {function, {function arguments}}
t['<PageUp>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['sine']]}}
t['<PageDown>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['sine']]}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}
--t['<PageUp>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
--t['<PageDown>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
--t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
--t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
--t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
--t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
require('neoscroll.config').set_mappings(t)

-- ##########################
-- ### DISABLING UNUSED NVIM PLUGINS
-- ##########################

local disabled_built_ins = {
	--"netrw",
	--"netrwPlugin",
	--"netrwSettings",
	--"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

