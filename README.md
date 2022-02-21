# Lspkind
> ℹ Icons for Lite XL LSP completions.

![](https://safe.kashima.moe/u1tpwtoq96tk.png)  

# Prerequisite
# Install
Clone this repo into your plugins directory for Lite XL, then move out the
`autocomplete.lua`.  
As an example, if in the Lite XL config directory (`~/.config/lite-xl`)
```
git clone https://github.com/onsails/lspkind-nvim plugins/lspkind
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
		TypeParameter = ''
	},
	font_name = 'Nerd Font', -- doesn't have to be exact
	size = 16 * SCALE -- Size of font for icons
	-- if the above font_name doesnt work (which will happen on windows)
	font_raw = nil -- renderer.font.load(USERDIR .. '/path/to/font.ttf', size * SCALE) -- as example
}
```

# License
MIT
