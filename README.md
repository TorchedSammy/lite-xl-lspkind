# Lspkind
> ℹ Icons for Lite XL LSP completions.

![](https://safe.kashima.moe/u1tpwtoq96tk.png)  

# Install
Clone this repo into your plugins directory for Lite XL, then move out the
`autocomplete.lua`.  
As an example, if in the Lite XL config directory (`~/.config/lite-xl`)
```
git clone https://github.com/TorchedSammy/lite-xl-lspkind.git plugins/lspkind
mv plugins/lspkind/autocomplete.lua plugins/
```

# Setup
Simple usage is like so:  
```lua
local lspkind = require 'plugins.lspkind'

-- These are the available values to config
-- Default symbols require a nerd font
lspkind.setup {
	symbols = {
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
		TypeParameter = '',
		Unknown = ''
	},
	format = 'symbolText', -- available default formats are text, symbol, symbolText and textSymbol
	fontName = 'Nerd Font', -- doesn't have to be exact
	size = 12 * SCALE, -- Size of font for icons
	-- if the above font_name doesnt work (which will happen on windows)
	font_raw = nil -- renderer.font.load(USERDIR .. '/path/to/font.ttf', size * SCALE) -- as example
}
```

If you want to add a custom format for the lspkind, `format` can be a function:  
```lua
local lspkind = require 'plugins.lspkind'

lspkind.setup {
	format = function(symbol, name)
		return string.format('%s | %s', symbol, name)
	end
}
```

# License
MIT
