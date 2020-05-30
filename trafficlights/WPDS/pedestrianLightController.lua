-- adjust figure below to set to correct pedestrian lights
ped1 = peripheral.wrap('monitor_6')
ped2 = peripheral.wrap('monitor_7')

redstoneInput = "right"			-- redstone input from pressure plates
bundleSide = "left"				-- side to which the redstone bundled wires are attached
tlComputer = 24 				-- enter ComputerID for the traffic light controller computer (Make sure it is the computer ID received when entering os.getComputerID() in lua

-- sequence selection
-- enter 1 for steady; enter 2 for blinking bottom
sequence = 2

-- display customisation

local topLightColor = colors.red
local bottomLightColor = colors.green
local bottomWaitColor = colors.white


-- adjust figures below to set how long each light is on
local timeforgreen = 5			-- time for how long the bottom light is on
local timeforyellow = 5			-- not yet used



-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local pedRequest = false
local flashspeed = 0.5

-- controller function

function listen()

    event, senderID, message = os.pullEvent()
    
	
    if event == "rednet_message" then
		print(senderID)
		print(message)
	
        if senderID == tlComputer then
			
			if message == "Pedestrian Detected?" then
			
				if pedRequest == false then
				
					rednet.send(tlComputer, "No")
					listen()
				end	
				
				if pedRequest == true then
					
					rednet.send(tlComputer, "Yes")
					
					senderID, message = rednet.receive()
					
					if senderID == tlComputer and message == "Pedestrian Allowed" then
					
						redstone.setBundledOutput(bundleSide, colors.yellow)
						startSequence()
						pedRequest = false
						redstone.setBundledOutput(bundleSide, 0)
						rednet.send(tlComputer, "Pedestrian Crossed")
						listen()						
						
					end
				end
			end
		end 
    end
    
    if event == "redstone" then
		
		local rsStatus = redstone.getInput(redstoneInput)
		
		if rsStatus == true then
			
			if pedRequest == false then
			
				pedRequest = true;
				bottomWait(ped1)
				bottomWait(ped2)
				redstone.setBundledOutput(bundleSide, colors.white)
			
			end
		end
    end
    
	listen()

end

-- coordination functions

-- to add


-- pedestrian traffic light sequences

function standardSequence()

	reset(ped1)
	reset(ped2)
	bottomLight(ped1)
	bottomLight(ped2)
	sleep(timeforgreen)
	reset(ped1)
	reset(ped2)
	topLight(ped1)
	topLight(ped2)
	
end

-- add japanese light for non-detection in traffic light script

function blinkSequence()

	reset(ped1)
	reset(ped2)
	bottomLight(ped1)
	bottomLight(ped2)
	sleep(timeforgreen)
	
	redstone.setBundledOutput(bundleSide, colors.orange)
	
	i = timeforgreen
	
		while i > 0 do
			
			reset(ped1)
			reset(ped2)
			sleep(flashspeed)
			bottomLight(ped1)
			bottomLight(ped2)
			sleep(flashspeed)
						
			i = i - 1
		
		end
	
	reset(ped1)
	reset(ped2)
	topLight(ped1)
	topLight(ped2)
	
end


-- pedestrian traffic light functions

function reset(mon)

	mon.setTextScale(2)
	mon.setBackgroundColor(colors.black)
	mon.clear()

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

-- Utility Functions

function startSequence()

	if sequence == 1 then
		standardSequence()
	end
	
	if sequence == 2 then
		blinkSequence()
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
	print("Pedestrian ControllerOS")
	
	term.setCursorPos(1,5)
	if sequence == 1 then print("Sequence: Standard") end
	if sequence == 2 then print("Sequence: Blink") end
	

end

function start()
	
	printInfo()
	redstone.setBundledOutput(bundleSide, 0)
	
	reset(ped1)
	reset(ped2)
	topLight(ped1)
	topLight(ped2)
	
	listen()
	
end

start()
