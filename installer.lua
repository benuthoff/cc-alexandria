-- Alexandria Install Script

-- Step 1: Create App Directory
write("\nStep 1: Create App Directory ")
if not fs.exists('/app') then
	fs.makeDir('/app')
end
print("[COMPLETE]")

-- Step 2: Add App Directory to Path
write("Step 2: Add App Directory to Path ")
shell.setPath(shell.path() .. ':/app')
print("[COMPLETE]")

-- Step 3: Download Application
write("Step 3: Download Application ")
local file = fs.open('/app/alexandria.lua', 'w')
local data = http.get('http://raw.githubusercontent.com/benuthoff/cc-alexandria/main/app/alexandria.lua')
file.write(data.readAll())
file.close()
print("[COMPLETE]")

-- Step 4: Create Settings
write("Step 4: Create Settings ")
print("[COMPLETE]")

-- Step 5: Create Alias
write("Step 5: Create Alias ")
shell.setAlias('brew', '/app/alexandria.lua')
print("[COMPLETE]")