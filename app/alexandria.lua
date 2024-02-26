-- Alexandria, CC:Tweaked Package Manager
-- Usage: alexandria ~~[action]~~ [name]

local name = ...
local req = http.get('http://raw.githubusercontent.com/benuthoff/cc-alexandria/main/app/'..name..'.lua')

if req == nil then
	printError('[ERR] Could not download program "'..name..'".')
else
	local file = fs.open('/app/'..name..'.lua','w')
	file.write(data)
	file.close()
end