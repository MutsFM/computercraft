-- adjust figure below to set to correct monitor
mon1 = peripheral.wrap('monitor_5') -- traffic light cars for through way
mon2 = peripheral.wrap('monitor_8') -- traffic light cars for through way
mon3 = peripheral.wrap('monitor_4') -- traffic light cars for side street

pedComputer = 26 -- Enter ComputerID for the pedestrianLightController computer

-- traffic light sequence mode
-- enter 1 for standard, enter 2 for British/German, enter 3 for warning, enter 4 for stop light
-- see readme for more information
local sequence = 1

-- traffic light shape
-- enter 1 for block
-- enter 2 for arrow left
-- enter 3 for arrow forward
-- enter 4 for arrow right
-- enter 5 for round
local mon1version = 1
local mon2version = 1
local mon3version = 1

-- Yellow or Orange? Depending on your country, the color may differ
-- Enter 1 for orange, enter 2 for yellow
local middle = 1 

-- adjust figures below to set how long each light is on
local timeforgreen1 = 10		-- set time for how long the through street has green
local timeforgreen2 = 5			-- set time for how long the side street had green
local timeforyellow = 3			-- set time for duration yellow light
local timeforturnred = 1		-- set time for pause in between having turned red on one light, and turning green on the other
local warninginterval = 1		-- set time for how quickly the warning and stop lights flashes

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local middleColor

function reset(mon)

	mon.setTextScale(0.5)
	mon.setBackgroundColor(colors.black)
	mon.clear()

end

-- Shape Functions

function shape(lvmon)
	
	if lvmon == mon1 then
		if mon1version == 1 then
			return 1
		end
		if mon1version == 2 then
			return 2
		end
		if mon1version == 3 then
			return 3
		end
		if mon1version == 4 then
			return 4
		end
		if mon1version == 5 then
			return 5
		end
	end
	
	if lvmon == mon2 then
		if mon2version == 1 then
			return 1
		end
		if mon2version == 2 then
			return 2
		end
		if mon2version == 3 then
			return 3
		end
		if mon2version == 4 then
			return 4
		end
		if mon2version == 5 then
			return 5
		end
	end
	
	if lvmon == mon3 then
		if mon3version == 1 then
			return 1
		end
		if mon3version == 2 then
			return 2
		end
		if mon3version == 3 then
			return 3
		end
		if mon3version == 4 then
			return 4
		end
		if mon3version == 5 then
			return 5
		end
	end
	
end

-- Traffic Light Setting Functions

function redLight(mon)

	lightShape = shape(mon)
	
	if lightShape == 1 then

		mon.setBackgroundColor(colors.red)
		mon.setCursorPos(4,2)
		mon.write("         ")
		mon.setCursorPos(4,3)
		mon.write("         ")
		mon.setCursorPos(4,4)
		mon.write("         ")
		mon.setCursorPos(4,5)
		mon.write("         ")
		mon.setCursorPos(4,6)
		mon.write("         ")
		mon.setCursorPos(4,7)
		mon.write("         ")
		
	end
	
	if lightShape == 2 then
			
		mon.setBackgroundColor(colors.red)
		mon.setCursorPos(5,1)
		mon.write("  ")
		mon.setCursorPos(4,2)
		mon.write("   ")
		mon.setCursorPos(3,3)
		mon.write("    ")
		mon.setCursorPos(2,4)
		mon.write("             ")
		mon.setCursorPos(2,5)
		mon.write("             ")
		mon.setCursorPos(3,6)
		mon.write("    ")
		mon.setCursorPos(4,7)
		mon.write("   ")
		mon.setCursorPos(5,8)
		mon.write("  ")
		
	end
	
	if lightShape == 3 then
			
		mon.setBackgroundColor(colors.red)
		mon.setCursorPos(7,1)
		mon.write("  ")
		mon.setCursorPos(6,2)
		mon.write("    ")
		mon.setCursorPos(5,3)
		mon.write("      ")
		mon.setCursorPos(4,4)
		mon.write("        ")
		mon.setCursorPos(4,5)
		mon.write("        ")
		mon.setCursorPos(7,6)
		mon.write("  ")
		mon.setCursorPos(7,7)
		mon.write("  ")
		mon.setCursorPos(7,8)
		mon.write("  ")
		mon.setCursorPos(7,9)
		mon.write("  ")
		
	end
	
	if lightShape == 4 then
			
		mon.setBackgroundColor(colors.red)
		mon.setCursorPos(10,1)
		mon.write("  ")
		mon.setCursorPos(10,2)
		mon.write("   ")
		mon.setCursorPos(10,3)
		mon.write("    ")
		mon.setCursorPos(2,4)
		mon.write("             ")
		mon.setCursorPos(2,5)
		mon.write("             ")
		mon.setCursorPos(10,6)
		mon.write("    ")
		mon.setCursorPos(10,7)
		mon.write("   ")
		mon.setCursorPos(10,8)
		mon.write("  ")
		
	end
	
	if lightShape == 5 then
			
		mon.setBackgroundColor(colors.red)
		mon.setCursorPos(5,1)
		mon.write("       ")
		mon.setCursorPos(4,2)
		mon.write("         ")
		mon.setCursorPos(3,3)
		mon.write("           ")
		mon.setCursorPos(2,4)
		mon.write("             ")
		mon.setCursorPos(2,5)
		mon.write("             ")
		mon.setCursorPos(3,6)
		mon.write("           ")
		mon.setCursorPos(4,7)
		mon.write("         ")
		mon.setCursorPos(5,8)
		mon.write("       ")
		
	end

end

function yellowLight(mon)

	lightShape = shape(mon)
	
	if lightShape == 1 then
	
		mon.setBackgroundColor(middleColor)
		mon.setCursorPos(4,10)
		mon.write("         ")
		mon.setCursorPos(4,11)
		mon.write("         ")
		mon.setCursorPos(4,12)
		mon.write("         ")
		mon.setCursorPos(4,13)
		mon.write("         ")
		mon.setCursorPos(4,14)
		mon.write("         ")
		mon.setCursorPos(4,15)
		mon.write("         ")
		
	end
	
	if lightShape == 2 then
			
		mon.setBackgroundColor(middleColor)
		mon.setCursorPos(5,9)
		mon.write("  ")
		mon.setCursorPos(4,10)
		mon.write("   ")
		mon.setCursorPos(3,11)
		mon.write("    ")
		mon.setCursorPos(2,12)
		mon.write("             ")
		mon.setCursorPos(2,13)
		mon.write("             ")
		mon.setCursorPos(3,14)
		mon.write("    ")
		mon.setCursorPos(4,15)
		mon.write("   ")
		mon.setCursorPos(5,16)
		mon.write("  ")
		
	end
	
	if lightShape == 3 then
			
		mon.setBackgroundColor(middleColor)
		mon.setCursorPos(7,9)
		mon.write("  ")
		mon.setCursorPos(6,10)
		mon.write("    ")
		mon.setCursorPos(5,11)
		mon.write("      ")
		mon.setCursorPos(4,12)
		mon.write("        ")
		mon.setCursorPos(4,13)
		mon.write("        ")
		mon.setCursorPos(7,14)
		mon.write("  ")
		mon.setCursorPos(7,15)
		mon.write("  ")
		mon.setCursorPos(7,16)
		mon.write("  ")
		mon.setCursorPos(7,17)
		mon.write("  ")
		
	end
	
	if lightShape == 4 then
			
		mon.setBackgroundColor(middleColor)
		mon.setCursorPos(10,9)
		mon.write("  ")
		mon.setCursorPos(10,10)
		mon.write("   ")
		mon.setCursorPos(10,11)
		mon.write("    ")
		mon.setCursorPos(2,12)
		mon.write("             ")
		mon.setCursorPos(2,13)
		mon.write("             ")
		mon.setCursorPos(10,14)
		mon.write("    ")
		mon.setCursorPos(10,15)
		mon.write("   ")
		mon.setCursorPos(10,16)
		mon.write("  ")
		
	end
	
	if lightShape == 5 then
			
		mon.setBackgroundColor(middleColor)
		mon.setCursorPos(5,9)
		mon.write("       ")
		mon.setCursorPos(4,10)
		mon.write("         ")
		mon.setCursorPos(3,11)
		mon.write("           ")
		mon.setCursorPos(2,12)
		mon.write("             ")
		mon.setCursorPos(2,13)
		mon.write("             ")
		mon.setCursorPos(3,14)
		mon.write("           ")
		mon.setCursorPos(4,15)
		mon.write("         ")
		mon.setCursorPos(5,16)
		mon.write("       ")
		
	end

end

function greenLight(mon)

	lightShape = shape(mon)
	
	if lightShape == 1 then
	
		mon.setBackgroundColor(colors.green)
		mon.setCursorPos(4,18)
		mon.write("         ")
		mon.setCursorPos(4,19)
		mon.write("         ")
		mon.setCursorPos(4,20)
		mon.write("         ")
		mon.setCursorPos(4,21)
		mon.write("         ")
		mon.setCursorPos(4,22)
		mon.write("         ")
		mon.setCursorPos(4,23)
		mon.write("         ")
		
	end
	
	if lightShape == 2 then
			
		mon.setBackgroundColor(colors.green)
		mon.setCursorPos(5,17)
		mon.write("  ")
		mon.setCursorPos(4,18)
		mon.write("   ")
		mon.setCursorPos(3,19)
		mon.write("    ")
		mon.setCursorPos(2,20)
		mon.write("             ")
		mon.setCursorPos(2,21)
		mon.write("             ")
		mon.setCursorPos(3,22)
		mon.write("    ")
		mon.setCursorPos(4,23)
		mon.write("   ")
		mon.setCursorPos(5,24)
		mon.write("  ")
		
	end
	
	if lightShape == 3 then
			
		mon.setBackgroundColor(colors.green)
		mon.setCursorPos(7,16)
		mon.write("  ")
		mon.setCursorPos(6,17)
		mon.write("    ")
		mon.setCursorPos(5,18)
		mon.write("      ")
		mon.setCursorPos(4,19)
		mon.write("        ")
		mon.setCursorPos(4,20)
		mon.write("        ")
		mon.setCursorPos(7,21)
		mon.write("  ")
		mon.setCursorPos(7,22)
		mon.write("  ")
		mon.setCursorPos(7,23)
		mon.write("  ")
		mon.setCursorPos(7,24)
		mon.write("  ")
		
	end
	
	if lightShape == 4 then
			
		mon.setBackgroundColor(colors.green)
		mon.setCursorPos(10,17)
		mon.write("  ")
		mon.setCursorPos(10,18)
		mon.write("   ")
		mon.setCursorPos(10,19)
		mon.write("    ")
		mon.setCursorPos(2,20)
		mon.write("             ")
		mon.setCursorPos(2,21)
		mon.write("             ")
		mon.setCursorPos(10,22)
		mon.write("    ")
		mon.setCursorPos(10,23)
		mon.write("   ")
		mon.setCursorPos(10,24)
		mon.write("  ")
		
	end
	
	if lightShape == 5 then
			
		mon.setBackgroundColor(colors.green)
		mon.setCursorPos(5,17)
		mon.write("       ")
		mon.setCursorPos(4,18)
		mon.write("         ")
		mon.setCursorPos(3,19)
		mon.write("           ")
		mon.setCursorPos(2,20)
		mon.write("             ")
		mon.setCursorPos(2,21)
		mon.write("             ")
		mon.setCursorPos(3,22)
		mon.write("           ")
		mon.setCursorPos(4,23)
		mon.write("         ")
		mon.setCursorPos(5,24)
		mon.write("       ")
		
	end

end

-- Traffic Light Sequence Functions

function standardSequence()

	-- Through Street has Green	// Side Street has Red
	reset(mon1)
	reset(mon2)
	reset(mon3)
	greenLight(mon1)
	greenLight(mon2)
	redLight(mon3)
	sleep(timeforgreen1)

	-- Through Street turns Yellow // Side Street Still Red
	reset(mon1)
	reset(mon2)
	yellowLight(mon1)
	yellowLight(mon2)
	sleep(timeforyellow)

	-- Through Street gets set to red
	reset(mon1)
	reset(mon2)
	redLight(mon1)
	redLight(mon2)
	sleep(timeforturnred)

	--Side street gets set to green
	reset(mon3)
	greenLight(mon3)
	sleep(timeforgreen2)

	-- Side street turns yellow // through street remains red
	reset(mon3)
	yellowLight(mon3)
	sleep(timeforyellow)

	-- Side street gets set to red
	reset(mon3)
	redLight(mon3)
	sleep(timeforturnred)
	
	-- Ask for Pedestrian Status
	rednet.send(pedComputer, "Pedestrian Detected?")
	
	senderID, message = rednet.receive()
	
	if senderID == pedComputer then
	
		if message == "Yes" then
		
			rednet.send(pedComputer, "Pedestrian Allowed")
			
			senderID, message = rednet.receive()
			
			if senderID == pedComputer and message == "Pedestrian Crossed" then
				
				sleep(timeforturnred)
				restart()
				
			end
		end
		
		if message == "No" then
			
			restart()
		
		end
	end

	restart()

end

function germanSequence()

	-- Through Street has Green	// Side Street has Red
	reset(mon1)
	reset(mon2)
	reset(mon3)
	greenLight(mon1)
	greenLight(mon2)
	redLight(mon3)
	sleep(timeforgreen1)

	-- Through Street turns Yellow // Side Street Still Red
	reset(mon1)
	reset(mon2)
	yellowLight(mon1)
	yellowLight(mon2)
	yellowLight(mon3)
	sleep(timeforyellow)

	-- Through Street gets set to red
	reset(mon1)
	reset(mon2)
	redLight(mon1)
	redLight(mon2)
	sleep(timeforturnred)

	--Side street gets set to green
	reset(mon3)
	greenLight(mon3)
	sleep(timeforgreen2)
	
	-- Ask for Pedestrian Status
	rednet.send(pedComputer, "Pedestrian Detected?")
	
	senderID, message = rednet.receive()
	
	if senderID == pedComputer then
	
		if message == "Yes" then
		
			-- Side street turns yellow // through street remains red
			reset(mon3)
			yellowLight(mon3)
			sleep(timeforyellow)

			-- Side street gets set to red
			reset(mon3)
			redLight(mon3)
			sleep(timeforturnred)
	
			-- Tell pedComputer pedestrians can go
			rednet.send(pedComputer, "Pedestrian Allowed")
			
			senderID, message = rednet.receive()
			
			if senderID == pedComputer and message == "Pedestrian Crossed" then
				
				yellowLight(mon1)
				yellowLight(mon2)
				sleep(timeforyellow)
				restart()
				
			end
		end
		
		if message == "No" then
			
			-- Side street turns yellow // through street remains red
			reset(mon3)
			yellowLight(mon1)
			yellowLight(mon2)
			yellowLight(mon3)
			sleep(timeforyellow)

			-- Side street gets set to red
			reset(mon3)
			redLight(mon3)
			sleep(timeforturnred)

			restart()
		
		end
	end

	restart()

	

end

function warningSequence()

	yellowLight(mon1)
	yellowLight(mon2)
	yellowLight(mon3)
	sleep(warninginterval)
	reset(mon1)
	reset(mon2)
	reset(mon3)
	sleep(warninginterval)
	
	warningSequence()

end

function stopSequence()

	redLight(mon1)
	redLight(mon2)
	redLight(mon3)
	sleep(warninginterval)
	reset(mon1)
	reset(mon2)
	reset(mon3)
	sleep(warninginterval)
	
	stopSequence()

end

-- Utility Functions

function restart()

	if sequence == 1 then
		standardSequence()
	end
	
	if sequence == 2 then
		germanSequence()
	end
	
	if sequence == 3 then
		warningSequence()
	end
	
	if sequence == 4 then
		stopSequence()
	end
end

function printInfo()

	term.clear()
	term.setTextColor(colors.red)
	term.setCursorPos(19,1)
	print("ArchiTech Inc.")
	term.setTextColor(colors.white)
	term.setCursorPos(14,2)
	print("Traffic Light Solutions")
	term.setCursorPos(15,3)
	print("Traffic ControllerOS")
	
	term.setCursorPos(1,5)
	if sequence == 1 then print("Sequence: Standard") end
	if sequence == 2 then print("Sequence: German/UK") end	
	if sequence == 3 then print("Sequence: Warning Light") end	
	if sequence == 4 then print("Sequence: StopLight") end
	
	term.setCursorPos(1,6)
	if middle == 1 then print("Color   : Orange") end
	if middle == 2 then print("Color   : Yellow") end	

end

function start()
	
	printInfo()
	
	
	if middle == 1 then
		middleColor = colors.orange
	end
	
	if middle == 2 then
		middleColor = colors.yellow
	end
	
	restart()
	
end

start()

