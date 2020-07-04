-- ArchiTech Traffic Lights
-- Pedestrian ControllerOS
-- For 1 Pedestrian Light
-- For demo purposes

-- adjust figure below to set to correct pedestrian lights
local ped1 = peripheral.wrap('monitor_1')

local tlComputer = 33 					-- Enter ComputerID for the traffic light controller computer (Make sure it is the computer ID received when entering os.getComputerID() in lua

-- Sequence Selection
-- Enter 1 for steady
-- Enter 2 for blinking bottom on yellow/orange
-- Enter 3 for slider sequence
sequence = 3

-- Display Customisation
local topLightColor = colors.red
local bottomLightColor = colors.green
local bottomWaitColor = colors.white

-- Timing Customisation
-- adjust figures below to set how long each light is on.
local timeforgreen = 10			-- time for how long the bottom light is on
local timeforyellow = 5			-- time for how long the bottom light blinks
local timeforred = 5

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local flashspeed = 0.5
local sliderSleep

-- Terminal Info
term.clear()
term.setTextColor(colors.red)
term.setCursorPos(14,1)
print("ArchiTech Traffic Lights")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Pedestrian Light Controller")
print("For 1 Pedestrian Light")

-- Controller Function

function listen()

    print("waiting for event")
    event, senderID, message = os.pullEvent()
    
    print("received event")
	
    if event == "rednet_message" then
		print(senderID)
		print(message)
	
       	if senderID == tlComputer and message == "Pedestrian Allowed" then
					
			startSequence()
			rednet.send(tlComputer, "Pedestrian Crossed")
			listen()						
						
			
		end 
    end
        
	listen()

end

-- pedestrian traffic light sequences

function standardSequence()

	reset(ped1)
	bottomLight(ped1)
	sleep(timeforgreen)
	reset(ped1)
	topLight(ped1)
	sleep(timeforred)
	
	startSequence()
	
end

function blinkSequence()

	reset(ped1)
	reset(ped2)
	bottomLight(ped1)
	bottomLight(ped2)
	sleep(timeforgreen)
		
	i = timeforyellow
	
		while i > 0 do
			
			reset(ped1)
			sleep(flashspeed)
			bottomLight(ped1)
			sleep(flashspeed)
						
			i = i - 1
		
		end
	
	reset(ped1)
	reset(ped2)
	topLight(ped1)
	topLight(ped2)
	sleep(timeforred)
	
	startSequence()
	
end

function sliderSequence()

	reset(ped1)	
	
	slider1(ped1)
	sleep(sliderSleep)
	
	slider2(ped1)
	sleep(sliderSleep)
	
	slider3(ped1)
	sleep(sliderSleep)

	slider4(ped1)
	sleep(sliderSleep)

	slider5(ped1)
	sleep(sliderSleep)
	
	slider6(ped1)
	sleep(sliderSleep)
	
	slider7(ped1)
	sleep(sliderSleep)

	slider8(ped1)
	sleep(sliderSleep)
	
	reset(ped1)
	topLight(ped1)
	sleep(timeforred)
	
	startSequence()
	
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

-- Slider Functions

function slider1(mon)
	
	mon.setTextScale(0.5)		
	mon.setBackgroundColor(bottomLightColor)
	mon.setCursorPos(1,6)
	mon.write("                  ")
	mon.setCursorPos(1,7)
	mon.write("                  ")
	mon.setCursorPos(1,8)
	mon.write("                  ")
	mon.setCursorPos(1,9)
	mon.write("                  ")
	mon.setCursorPos(1,10)
	mon.write("                  ")	
	
end

function slider2(mon)

	mon.setBackgroundColor(colors.black)
	mon.setCursorPos(1,6)
	mon.write("  ")
	mon.setCursorPos(1,7)
	mon.write("  ")
	mon.setCursorPos(1,8)
	mon.write("  ")
	mon.setCursorPos(1,9)
	mon.write("  ")
	mon.setCursorPos(1,10)
	mon.write("  ")

end

function slider3(mon)

	mon.setCursorPos(1,6)
	mon.write("    ")
	mon.setCursorPos(1,7)
	mon.write("    ")
	mon.setCursorPos(1,8)
	mon.write("    ")
	mon.setCursorPos(1,9)
	mon.write("    ")
	mon.setCursorPos(1,10)
	mon.write("    ")

end

function slider4(mon)

	mon.setCursorPos(1,6)
	mon.write("      ")
	mon.setCursorPos(1,7)
	mon.write("      ")
	mon.setCursorPos(1,8)
	mon.write("      ")
	mon.setCursorPos(1,9)
	mon.write("      ")
	mon.setCursorPos(1,10)
	mon.write("      ")

end

function slider5(mon)

	mon.setCursorPos(1,6)
	mon.write("        ")
	mon.setCursorPos(1,7)
	mon.write("        ")
	mon.setCursorPos(1,8)
	mon.write("        ")
	mon.setCursorPos(1,9)
	mon.write("        ")
	mon.setCursorPos(1,10)
	mon.write("        ")

end

function slider6(mon)

	mon.setCursorPos(1,6)
	mon.write("          ")
	mon.setCursorPos(1,7)
	mon.write("          ")
	mon.setCursorPos(1,8)
	mon.write("          ")
	mon.setCursorPos(1,9)
	mon.write("          ")
	mon.setCursorPos(1,10)
	mon.write("          ")

end

function slider7(mon)

	mon.setCursorPos(1,6)
	mon.write("            ")
	mon.setCursorPos(1,7)
	mon.write("            ")
	mon.setCursorPos(1,8)
	mon.write("            ")
	mon.setCursorPos(1,9)
	mon.write("            ")
	mon.setCursorPos(1,10)
	mon.write("            ")	

end

function slider8(mon)

	mon.setCursorPos(1,6)
	mon.write("              ")
	mon.setCursorPos(1,7)
	mon.write("              ")	
	mon.setCursorPos(1,8)
	mon.write("              ")
	mon.setCursorPos(1,9)
	mon.write("              ")	
	mon.setCursorPos(1,10)
	mon.write("              ")	

end

-- Utility Functions

function startSequence()

	if sequence == 1 then
		standardSequence()
	end
	
	if sequence == 2 then
		blinkSequence()
	end
	
	if sequence == 3 then
		sliderSequence()
	end

end

function calculateSlider()

	sliderSleep = (timeforgreen / 8)

end

function start()
	
	calculateSlider()
	
	reset(ped1)
	topLight(ped1)
	
	startSequence()
	
end

start()
