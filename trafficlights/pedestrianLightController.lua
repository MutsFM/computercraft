-- ArchiTech Traffic Lights
-- Pedestrian ControllerOS
-- For 2 Pedestrian Lights

-- adjust figure below to set to correct pedestrian lights
local ped1 = peripheral.wrap('monitor_6')
local ped2 = peripheral.wrap('monitor_7')

local redstoneInput = "right"			-- Redstone input from wires connected to the pressure plates
local bundleSide = "left"				-- Side to which the redstone bundled wires are attached
local tlComputer = 24 					-- Enter ComputerID for the traffic light controller computer (Make sure it is the computer ID received when entering os.getComputerID() in lua

-- Sequence Selection
-- Enter 1 for steady
-- Enter 2 for blinking bottom on yellow/orange
sequence = 2

-- Display Customisation
local topLightColor = colors.red
local bottomLightColor = colors.green
local bottomWaitColor = colors.white

-- Timing Customisation
-- adjust figures below to set how long each light is on.
local timeforgreen = 5			-- time for how long the bottom light is on
local timeforyellow = 5			-- not yet used

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local pedRequest = false
local flashspeed = 0.5

-- Controller Function

function listen()

    print("waiting for event")
    event, senderID, message = os.pullEvent()
    
    print("received event")
	
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

function start()
	
	redstone.setBundledOutput(bundleSide, 0)
	
	reset(ped1)
	reset(ped2)
	topLight(ped1)
	topLight(ped2)
	
	listen()
	
end

start()
