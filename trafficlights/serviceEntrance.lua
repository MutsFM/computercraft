-- ArchiTech Traffic Lights
-- Service Entrance OS

local name
local password
local doorSide = "right"

function writeTop()

	term.clear()
	term.setTextColor(colors.red)
	term.setCursorPos(19,1)
	print("ArchiTech Inc.")
	term.setTextColor(colors.white)
	term.setCursorPos(14,2)
	print("Traffic Light Solutions")
	term.setCursorPos(17,3)
	print("Service Entrance")

end

function askNaP()
	
	writeTop()
	term.setCursorPos(1,6)
	print("Enter your name:")
	name = read()
	
	checkName()
end

function checkName()

	writeTop()
	term.setCursorPos(1,6)
	
	if name == "basyoo" or name == "MutsFM" then
		
		askPassword()
		
	else 
	
		print("Person Not Found In Database")
		print("Enter a new name:")
		name = read()
	
		term.clearLine(8)
	
		checkName()
		
	end
	
end

function askPassword()

	term.clearLine(6)
	term.clearLine(7)
	term.clearLine(8)
	print("Welcome "..name)
	print("Enter your password:")
	password = read("*")
	checkPassword()

end

function checkPassword()

	if name == "basyoo" and password == "grasbroek" then
		acceptPassword()
	
	elseif name == "MutsFM" and password == "prishtina" then
		acceptPassword()
	
	else
		rejectPassword()
	end

end

function rejectPassword()
	
	writeTop()
	
	term.setCursorPos(1,6)
	print("Incorrect Password")
	print("Re-enter your password:")
	password = read("*")
	term.clearLine(8)
	checkPassword()
	
end

function acceptPassword()
	
	writeTop()
	
	term.setCursorPos(1,6)
	print("Password Correct")
	sleep(1)
	mainScreen()
	
end

function mainScreen()

	writeTop()
	
	term.setCursorPos(1,6)
	print("What do you want to do?")
	print("1. Open Door")
	print("2. Close Door")
	print("3. Log Out")
	print("4. Turn Off")
	
	local event, key = os.pullEvent("char")
	
	if key == "1" then
		openDoor()
	end
	
	if key == "2" then
		closeDoor()
	end
	
	if key == "3" then
		logOut()
	end
	
	if key == "4" then
		turnOff()
	end	
	
end

function openDoor()
	
	redstone.setOutput(doorSide, true)
	mainScreen()

end

function closeDoor()
	
	redstone.setOutput(doorSide, false)
	mainScreen()

end

function logOut()

	writeTop()
	
	term.setCursorPos(1,6)
	print("Logging Out...")
	sleep(2)
	askNaP()

end

function turnOff()

	writeTop()
	
	term.setCursorPos(1,6)
	print("Turning Off...")
	sleep(2)
	os.shutdown()

end


function start()
	closeDoor()
	writeTop()
	askNaP()
end

start()
