-- ArchiTech Traffic Lights
-- Traffic ControllerOS
-- For 2+1 Traffic Lights

-- Adjust figure below to set to correct monitor
local mon1 = peripheral.wrap('monitor_9') -- traffic light cars for through way
local mon2 = peripheral.wrap('monitor_10') -- traffic light cars for through way
local mon3 = peripheral.wrap('monitor_11') -- traffic light cars for side street
local ped1 = peripheral.wrap('monitor_1')
local ped2 = peripheral.wrap('monitor_2')

----------------------------------
-- Traffic Lights Customisation --
----------------------------------
-- Traffic Light Sequence Mode
-- Enter 1 for standard
-- Enter 2 for British/German
-- Enter 3 for warning
-- Enter 4 for stop light
local sequence = 2

-- Traffic Light Shape
-- Enter 1 for block
-- Enter 2 for arrow left
-- Enter 3 for arrow forward
-- Enter 4 for arrow right
-- Enter 5 for round
local mon1version = 1
local mon2version = 1
local mon3version = 1

-- Yellow or Orange? Depending on your country, the color may differ
-- Enter 1 for orange
-- Enter 2 for yellow
local middle = 1 

-------------------------------------
-- Pedestrian Lights Customisation --
-------------------------------------
--Consider whether to add sequence options

-- Display Customisation
local topLightColor = colors.red
local bottomLightColor = colors.green
local bottomWaitColor = colors.white

----------------------------------
-- Time Customisation --
----------------------------------

-- Traffic Lights Time Customisation
-- Adjust figures below to set how long each light is on
local timeforgreen1 = 10		-- set time for how long the through street has green
local timeforgreen2 = 5			-- set time for how long the side street had green
local timeforyellow = 3			-- set time for duration yellow light
local timeforturnred = 1		-- set time for pause in between having turned red on one light, and turning green on the other
local warninginterval = 1		-- set time for how quickly the warning and stop lights flashes

-- Pedestrian Lights Time Customisation
-- adjust figures below to set how long each light is on.
local timeforgreenPed = 10			-- time for how long the bottom light is on
local timeforyellowPed = 5			-- time for how long the bottom light blinks

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local middleColor		-- Variable for the orange or yellow color of traffic lights

local flashspeed = 0.5	-- Variable for the pedestrian lights "yellow" blinking part

local calculatedPedWaitTimer
local currentPedWaitTimer
local currentPedGreenTimer

-----------------------------------
-- Traffic Light Shape Functions --
-----------------------------------

function shape(lvmon)
	
	if lvmon == mon1 then
		if mon1version == 1 then
			return 1
		elseif mon1version == 2 then
			return 2
		elseif mon1version == 3 then
			return 3
		elseif mon1version == 4 then
			return 4
		elseif mon1version == 5 then
			return 5
		end
	end
	
	if lvmon == mon2 then
		if mon2version == 1 then
			return 1
		elseif mon2version == 2 then
			return 2
		elseif mon2version == 3 then
			return 3
		elseif mon2version == 4 then
			return 4
		elseif mon2version == 5 then
			return 5
		end
	end
	
	if lvmon == mon3 then
		if mon3version == 1 then
			return 1
		elseif mon3version == 2 then
			return 2
		elseif mon3version == 3 then
			return 3
		elseif mon3version == 4 then
			return 4
		elseif mon3version == 5 then
			return 5
		end
	end
	
end

-------------------------------------
-- Traffic Light Setting Functions --
-------------------------------------

function reset(mon)

	mon.setTextScale(0.5)
	mon.setBackgroundColor(colors.black)
	mon.clear()

end

function redLight(mon)

	mon.setBackgroundColor(colors.red)
	lightShape = shape(mon)
	
	if lightShape == 1 then shapeBlock(mon, "red")
	elseif lightShape == 2 then shapeLeftArrow(mon, "red")	
	elseif lightShape == 3 then shapeForwardArrow(mon, "red")
	elseif lightShape == 4 then shapeRightArrow(mon, "red")
	elseif lightShape == 5 then shapeRound(mon, "red")
	end

end

function yellowLight(mon)

	mon.setBackgroundColor(middleColor)
	lightShape = shape(mon)
	
	if lightShape == 1 then	shapeBlock(mon, "yellow")
	elseif lightShape == 2 then shapeLeftArrow(mon, "yellow")
	elseif lightShape == 3 then shapeForwardArrow(mon, "yellow")
	elseif lightShape == 4 then shapeRightArrow(mon, "yellow")
	elseif lightShape == 5 then shapeRound(mon, "yellow")
	end

end

function greenLight(mon)

	mon.setBackgroundColor(colors.green)
	lightShape = shape(mon)
		
	if lightShape == 1 then shapeBlock(mon, "green")
	elseif lightShape == 2 then shapeLeftArrow(mon, "green")
	elseif lightShape == 3 then	shapeForwardArrow(mon, "green")
	elseif lightShape == 4 then shapeRightArrow(mon, "green")
	elseif lightShape == 5 then shapeRound(mon, "green")		
	end

end

-- Draw Shape Functions

function shapeBlock(mon, lightSelected)

	if lightSelected == "red" then
		line1, line2, line3, line4, line5, line6 = 2,3,4,5,6,7
	elseif lightSelected == "yellow" then
		line1, line2, line3, line4, line5, line6 = 10,11,12,13,14,15
	elseif lightSelected == "green" then
		line1, line2, line3, line4, line5, line6 = 18,19,20,21,22,23
	end
	
	mon.setCursorPos(4,line1)
	mon.write("         ")
	mon.setCursorPos(4,line2)
	mon.write("         ")
	mon.setCursorPos(4,line3)
	mon.write("         ")
	mon.setCursorPos(4,line4)
	mon.write("         ")
	mon.setCursorPos(4,line5)
	mon.write("         ")
	mon.setCursorPos(4,line6)
	mon.write("         ")

end

function shapeLeftArrow(mon, lightSelected)

	if lightSelected == "red" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 1,2,3,4,5,6,7,8
	elseif lightSelected == "yellow" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 9,10,11,12,13,14,15,16
	elseif lightSelected == "green" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 17,18,19,20,21,22,23,24
	end
	
	mon.setCursorPos(5,line1)
	mon.write("  ")
	mon.setCursorPos(4,line2)
	mon.write("   ")
	mon.setCursorPos(3,line3)
	mon.write("    ")
	mon.setCursorPos(2,line4)
	mon.write("             ")
	mon.setCursorPos(2,line5)
	mon.write("             ")
	mon.setCursorPos(3,line6)
	mon.write("    ")
	mon.setCursorPos(4,line7)
	mon.write("   ")
	mon.setCursorPos(5,line8)
	mon.write("  ")

end

function shapeForwardArrow(mon, lightSelected)

	if lightSelected == "red" then
		line1, line2, line3, line4, line5, line6, line7, line8, line9 = 1,2,3,4,5,6,7,8,9
	elseif lightSelected == "yellow" then
		line1, line2, line3, line4, line5, line6, line7, line8, line9 = 9,10,11,12,13,14,15,16,17
	elseif lightSelected == "green" then
		line1, line2, line3, line4, line5, line6, line7, line8, line9 = 16,17,18,19,20,21,22,23,24
	end

	mon.setCursorPos(7,line1)
	mon.write("  ")
	mon.setCursorPos(6,line2)
	mon.write("    ")
	mon.setCursorPos(5,line3)
	mon.write("      ")
	mon.setCursorPos(4,line4)
	mon.write("        ")
	mon.setCursorPos(4,line5)
	mon.write("        ")
	mon.setCursorPos(7,line6)
	mon.write("  ")
	mon.setCursorPos(7,line7)
	mon.write("  ")
	mon.setCursorPos(7,line8)
	mon.write("  ")
	mon.setCursorPos(7,line9)
	mon.write("  ")
			
end

function shapeRightArrow(mon, lightSelected)

	if lightSelected == "red" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 1,2,3,4,5,6,7,8
	elseif lightSelected == "yellow" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 9,10,11,12,13,14,15,16
	elseif lightSelected == "green" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 17,18,19,20,21,22,23,24
	end

	mon.setCursorPos(10,line1)
	mon.write("  ")
	mon.setCursorPos(10,line2)
	mon.write("   ")
	mon.setCursorPos(10,line3)
	mon.write("    ")
	mon.setCursorPos(2,line4)
	mon.write("             ")
	mon.setCursorPos(2,line5)
	mon.write("             ")
	mon.setCursorPos(10,line6)
	mon.write("    ")
	mon.setCursorPos(10,line7)
	mon.write("   ")
	mon.setCursorPos(10,line8)
	mon.write("  ")
		
end

function shapeRound(mon, lightSelected)

	if lightSelected == "red" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 1,2,3,4,5,6,7,8
	elseif lightSelected == "yellow" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 9,10,11,12,13,14,15,16
	elseif lightSelected == "green" then
		line1, line2, line3, line4, line5, line6, line7, line8 = 17,18,19,20,21,22,23,24
	end
	
	mon.setCursorPos(5,line1)
	mon.write("       ")
	mon.setCursorPos(4,line2)
	mon.write("         ")
	mon.setCursorPos(3,line3)
	mon.write("           ")
	mon.setCursorPos(2,line4)
	mon.write("             ")
	mon.setCursorPos(2,line5)
	mon.write("             ")
	mon.setCursorPos(3,line6)
	mon.write("           ")
	mon.setCursorPos(4,line7)
	mon.write("         ")
	mon.setCursorPos(5,line8)
	mon.write("       ")
		
end

----------------------------------------
-- Pedestrian Light Setting Functions --
----------------------------------------

function resetPed(ped)

	ped.setTextScale(2)
	ped.setBackgroundColor(colors.black)
	ped.clear()

end

function topLight(mon)
	
	mon.setCursorPos(1,1)
	mon.setTextColor(topLightColor)
	mon.write("STOP")

end

function bottomLight(mon)

	mon.setCursorPos(1,2)
	mon.setTextColor(bottomLightColor)
	mon.write("WALK")
	
end

function bottomWait(mon)

	mon.setCursorPos(1,2)
	mon.setTextColor(bottomWaitColor)
	mon.write("WAIT")

end

function waitCounter(mon, timeToDisplay)
	
	if timeToDisplay < 10 then
		mon.setCursorPos(3,2)
		mon.setTextColor(topLightColor)
		mon.write(timeToDisplay)
	else
		mon.setCursorPos(2,2)
		mon.setTextColor(topLightColor)
		mon.write(timeToDisplay)
	end
	
end

function greenCounter(mon, timeToDisplay)

	if timeToDisplay < 10 then
		mon.setCursorPos(3,1)
		mon.setTextColor(bottomLightColor)
		mon.write(timeToDisplay)
	else
		mon.setCursorPos(2,1)
		mon.setTextColor(bottomLightColor)
		mon.write(timeToDisplay)
	end
	
end

--------------------------------------
-- Sequence Functions --
--------------------------------------

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
			
			-- Wait for pedComputer to say it is back to red
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

function timerSequence()

	-- Stage 1: Through Street has Green // Side street has red // Pedestrians have red
	
	reset(mon1)
	reset(mon2)
	greenLight(mon1)
	greenLight(mon2)
		
	i = timeforgreen1
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
			
		end
	
	
	-- Stage 2: Through Street turns yellow, side street red/yellow, ped red
	
	reset(mon1)
	reset(mon2)
	yellowLight(mon1)
	yellowLight(mon2)
	yellowLight(mon3)

	i = timeforyellow
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	
	-- Stage 3: Through streets gets set to red
	
	reset(mon1)
	reset(mon2)
	redLight(mon1)
	redLight(mon2)
	
	i = timeforturnred
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	
	-- Stage 4: Side Street gets set to Green
	
	reset(mon3)
	greenLight(mon3)
	
	i = timeforgreen2
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	-- Stage 5: Side street turns yellow // through street remains red
	
	reset(mon3)
	yellowLight(mon3)
	
	i = timeforyellow
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	
	-- Stage 6: Side street gets set to red
	
	reset(mon3)
	redLight(mon3)
	
	i = timeforturnred
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	-- Stage 7: Ped Lights Green
	
	resetPed(ped1)
	resetPed(ped2)
	bottomLight(ped1)
	bottomLight(ped2)
	
	-- TO INSERT BLINKING TIMER AT LATER STAGE	
	currentPedGreenTimer = timeforgreenPed
	i = timeforgreenPed
	
		while i > 0 do
			
			greenCounter(ped1, currentPedGreenTimer)
			greenCounter(ped2, currentPedGreenTimer)
			
			sleep(1)
			
			currentPedGreenTimer = currentPedGreenTimer - 1
			i = i - 1
		end
	

	-- Stage 8: Reset Pedestrian Wait Timer
	currentPedWaitTimer = calculatedPedWaitTimer
	
	-- Stage 9: Ped to Red, Through Street to Yellow
	
	yellowLight(mon1)
	yellowLight(mon2)
	resetPed(ped1)
	resetPed(ped2)
	topLight(ped1)
	topLight(ped2)
	
	i = timeforyellow
	
		while i > 0 do
		
			waitCounter(ped1, currentPedWaitTimer)
			waitCounter(ped2, currentPedWaitTimer)
			
			sleep(1)
			
			currentPedWaitTimer = currentPedWaitTimer - 1
			i = i - 1
		
		end
	
	timerSequence()
	
end

-----------------------
-- Utility Functions --
-----------------------

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
	
	if sequence == 5 then
		timerStartLights()
	end
	
end

function calculatePedWaitTimer()
	
	calculatedPedWaitTimer = timeforyellow + timeforgreen1 + timeforyellow + timeforturnred + timeforgreen2 + timeforyellow + timeforturnred

end

function timerStartLights()

	calculatePedWaitTimer()
	
	currentPedWaitTimer = calculatedPedWaitTimer - timeforyellow
	
	reset(mon1)
	reset(mon2)
	reset(mon3)
	greenLight(mon1)
	greenLight(mon2)
	redLight(mon3)
	
	resetPed(ped1)
	resetPed(ped2)
	topLight(ped1)
	topLight(ped2)
	
	timerSequence()
	
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
	
	print("Setup	: 2 + 1")

end

function start()
	
	printInfo()
	
	if middle == 1 then middleColor = colors.orange	end
	if middle == 2 then middleColor = colors.yellow	end
	
	restart()
	
end

start()