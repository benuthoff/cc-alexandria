-- Alexandria Install Script

-- Step 1: Create App Directory
write("Step 1: Create App Directory ")
if not fs.exists('/app') then
	fs.makeDir('/app')
end
print("[COMPLETE]")

-- Step 2: Download Application
write("Step 3: Download Application ")
local file = fs.open('/app/alexandria.lua', 'w')
local data = http.get('http://raw.githubusercontent.com/benuthoff/cc-alexandria/main/app/alexandria.lua')
file.write(data.readAll())
file.close()
print("[COMPLETE]")

-- Step 3: Create Startup
write("Step 4: Create Startup & Alias ")
shell.setPath(shell.path() .. ':/app')
shell.setAlias('brew', '/app/alexandria.lua')
local file = fs.open('.startup.lua', 'a')
file.writeLine("shell.setPath(shell.path() .. ':/app')")
file.writeLine("shell.setAlias('brew', '/app/alexandria.lua')")
file.close()
print("[COMPLETE]")