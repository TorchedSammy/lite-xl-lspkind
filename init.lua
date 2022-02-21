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
	format = 'symbolText',
	font_name = 'Nerd Font',
	size = 12 * SCALE
}
local formatters = {}

function formatters.text(_, name)
	return name
end
function formatters.symbol(symbol, _)
	return symbol
end
function formatters.symbolText(symbol, name)
	return symbol .. ' ' .. name
end
function formatters.textSymbol(symbol, name)
	return name .. ' ' .. symbol
end

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

local function getKind(id, symbols)
	local kindName = getKindName(id)
	local kindIcon = symbols[kindName]

	return kindIcon, kindName
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

	local formatKind
	if type(opts.format) == 'function' then
		formatKind = opts.format
	else
		local formatFunc = formatters[opts.format]
		if not formatFunc then formatFunc = formatters.text end

		formatKind = formatFunc
	end

	function Server.get_completion_item_kind(id)
		local symbol, name = getKind(id, symbols)
		return formatKind(symbol, name)
	end
end

return M
