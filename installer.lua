-- Alexandria Install Script

-- Step 1: Create App Directory
if not fs.exists('/app') then
	fs.makeDir('/app')
end

-- Step 2: Add App Directory to Path
shell.setPath(shell.path() .. '/app')

-- Step 3: Download Application
local file = fs.open('/app/alexandria.lua', w)
local data = http.get('http://raw.githubusercontent.com/benuthoff/cc-alexandria/main/alexandria.lua')
file.write(data.readAll())

-- Step 4: Create Settings
-- [Nothing here yet...]

-- Step 5: Create Alias
shell.setAlias('brew', '/app/alexandria.lua')
shell.setAlias('install', '/app/alexandria.lua')