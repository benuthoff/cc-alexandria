-- Alexandria, CC:Tweaked Package Manager
-- Usage: alexandria [name]

local name = ...
local req = http.get('http://raw.githubusercontent.com/benuthoff/cc-alexandria/main/app/'..name..'.lua')

if req == nil then
	printError('[ERR] Could not download program "'..name..'".')
else
	if fs.exists('/app/'..name..'.lua') then
		print('Updating program...')
	else
		print('Downloading program...')
	end
	local file = fs.open('/app/'..name..'.lua','w')
	file.write(req.readAll())
	file.close()
	term.setTextColor(colors.lime)
	print('[ Operation Successful ]')
end

req.close()