-- Paledit
-- Terminal Palette Editor

-- Usage: paledit [palette]

color_names = {
	'white', 'orange', 'magenta', 'lightBlue',
	'yellow', 'lime', 'pink', 'gray', 
	'lightGray', 'cyan', 'purple', 'blue',
	'brown', 'green', 'red', 'black'
}

palette_size = 2
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
elseif args[1] == 'startup' then
	shell.run('paledit', settings.get('paledit.palette', 'default'), 'quiet')
elseif args[1] == 'show' then
	print('')
	term.blit('                ','0000000000000000','0011223344556677')
	print('')
	term.blit('                ','0000000000000000','8899aabbccddeeff')
	print('\n')
elseif args[1] == 'gallery' then

	print('')
	term.blit('                ','0000000000000000','0011223344556677')
	print('')
	term.blit('                ','0000000000000000','8899aabbccddeeff')
	print('\n')

	local w, h = term.getSize()
	local x, y = term.getCursorPos()
	local i = 1;
	shell.run('paledit', palette_gallery[i])
	term.write(' <- default ->  | Q to Quit')

	while true do
		local event, key = os.pullEvent('key_up')
		local kn = keys.getName(key);
		for r=1,w do term.setCursorPos(r,y) term.blit(' ','0','f') end
		term.setCursorPos(x,y)

		if kn == 'q' then
			shell.run('paledit', 'startup')
			break
		elseif kn == 'right' then
			i = i + 1
			if i > palette_size then i = 1 end
			shell.run('paledit', palette_gallery[i])
		elseif kn == 'left' then
			i = i - 1
			if i < 1 then i = palette_size end
			shell.run('paledit', palette_gallery[i])
		end

		term.write(' <- '..palette_gallery[i]..' ->  | Q to Quit')

	end

elseif default_palettes[args[1]] then
	for i=1,16 do
		term.setPaletteColor(colors[color_names[i]],default_palettes[args[1]][i])
	end
	settings.set('paledit.palette',args[1])
	settings.save()
	if not args[2] == 'quiet' then
		print('Palette set to '..args[1]..'!')
	end
end