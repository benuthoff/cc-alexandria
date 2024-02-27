-- Paledit
-- Terminal Palette Editor

-- Usage: paledit [palette]

color_names = {
	'white', 'orange', 'magenta', 'lightBlue',
	'yellow', 'lime', 'pink', 'gray', 
	'lightGray', 'cyan', 'purple', 'blue',
	'brown', 'green', 'red', 'black'
}

palette_gallery = {'default','apela'}
default_palettes = {}
default_palettes['default'] = {
	0xF0F0F0, 0xF2B233, 0xE57FD8, 0x99B2F2,
	0xDEDE6C, 0x7FCC19, 0xF2B2CC, 0x4C4C4C,
	0x999999, 0x4C99B2, 0xB266E5, 0x3366CC,
	0x7F664C, 0x57A64E, 0xCC4C4C, 0x111111
}
default_palettes['apela'] = {
	0xffffff, 0xcdac08, 0xbf5af2, 0x76d6ff,
	0xffd60a, 0x32d74b, 0xfe4439, 0x404044,
	0x98989d, 0x479ec2, 0x9647bf, 0x0869cb,
	0x6b4c40, 0x25a438, 0xcc372e, 0x1e1e1e
}

local args = {...}

if not args[1] then
	print('Paledit - Terminal Palette Editor')
	print('Usage: paledit show    - shows all terminal colors')
	print('       paledit gallery - show a carousel of palettes')
	print('       paledit [name]  - sets the palette to [name]')
elseif args[1] == 'show' then
	print('')
	term.blit('                ','0000000000000000','0011223344556677')
	print('')
	term.blit('                ','0000000000000000','8899aabbccddeeff')
	print('\n')
elseif args[1] == 'gallery' then

	local width

	print('')
	term.blit('                ','0000000000000000','0011223344556677')
	print('')
	term.blit('                ','0000000000000000','8899aabbccddeeff')
	print('')

	local w, h = term.getSize()
	local x, y = term.getCursorPos()
	local i = 1;

	while true do
		local event, key = os.pullEvent('key_up')
		for r=1,w do term.setCursorPos(r,y) term.blit(' ','0','f') end
		term.setCursorPos(x,y)
		term.write(' <- '..palette_gallery[i]..' ->  |  Press Q to Quit')
		term.write(' ['..keys.getName(key)..']')
	end

elseif default_palettes[args[1]] then
	print('Palette set to \''..args[1]..'\'!')
	for i=1,16 do
		term.setPaletteColor(colors[color_names[i]],default_palettes[args[1]][i])
	end
end