-- mod-version:2 -- lite-xl 2.0
local style = require 'core.style'
local common = require 'core.common'
local util = require 'plugins.lsp.util'
local Server = require 'plugins.lsp.server'

local kindPresets = {
	default = {
		Text = '',
		Method = '',
		Function = '',
		Constructor = '',
		Field = 'ﰠ',
		Variable = '',
		Class = 'ﴯ',
		Interface = '',
		Module = '',
		Property = 'ﰠ',
		Unit = '塞',
		Value = '',
		Enum = '',
		Keyword = '',
		Snippet = '',
		Color = '',
		File = '',
		Reference = '',
		Folder = '',
		EnumMember = '',
		Constant = '',
		Struct = 'פּ',
		Event = '',
		Operator = '',
		TypeParameter = ''
	}
}
local defaultOpts = {
	font_name = 'Nerd Font',
	size = 16 * SCALE
}

local function font(name, size)
	local proc = process.start {'sh', '-c', 'fc-list | grep "' .. name ..'"'}
	proc:wait(200)
	local out = proc:read_stdout() or ''
	local file = util.split(out, ':')[1]

	return renderer.font.load(file, size)
end

local function getKindName(id)
	return Server.completion_item_kind[id] or ''
end

local function getKindIcon(id, symbols)
	local kindName = getKindName(id)
	local kindIcon = symbols[kindName]

	return kindIcon
end

local M = {}

--- Setup Lspkind icons
--- @param opts table
function M.setup(opts)
	opts = common.merge(defaultOpts, opts)
	local symbols = common.merge(kindPresets.default, opts.symbols)
	if opts.font_raw then
		style.kind_font = opts.font_raw
	else
		style.kind_font = font(opts.font_name, opts.size)
	end

	function Server.get_completion_item_kind(id)
		return getKindIcon(id, symbols)
	end
end

return M
