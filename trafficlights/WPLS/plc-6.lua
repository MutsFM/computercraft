-- ArchiTech Traffic Lights
-- Pedestrian ControllerOS
-- With Pedestrian Sound
-- For 6 Pedestrian Lights

-- adjust figure below to set to correct pedestrian lights
local ped1 = peripheral.wrap('monitor_1')
local ped2 = peripheral.wrap('monitor_2')
local ped3 = peripheral.wrap('monitor_3')
local ped4 = peripheral.wrap('monitor_4')
local ped5 = peripheral.wrap('monitor_5')
local ped6 = peripheral.wrap('monitor_6')

local bundleSide = "left"				-- Side to which the redstone bundled wires are attached
local tlComputer = 1 					-- Enter ComputerID for the traffic light controller computer (Make sure it is the computer ID received when entering os.getComputerID() in lua

-- Sequence Selection
-- Enter 1 for steady
-- Enter 2 for blinking bottom on yellow/orange
-- Enter 3 for slider sequence
sequence = 2

-- Display Customisation
local topLightColor = colors.red
local bottomLightColor = colors.green
local bottomWaitColor = colors.white

-- Timing Customisation
-- adjust figures below to set how long each light is on.
local timeforgreen = 10			-- time for how long the bottom light is on
local timeforyellow = 5			-- time for how long the bottom light blinks

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local pedRequest = false
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
print("With Pedestrian Sound")
print("For 6 Pedestrian Lights")

-- Controller Function

function listen()

    print("waiting for event")
    event, senderID, message = os.pullEvent()
    
    print("received event")
	
    if event == "rednet_message" then
		print(senderID)
		print(message)
	
       	if senderID == tlComputer and message == "Pedestrian Allowed" then
					
			redstone.setBundledOutput(bundleSide, colors.yellow)
			startSequence()
			redstone.setBundledOutput(bundleSide, colors.white)
			rednet.send(tlComputer, "Pedestrian Crossed")
			listen()						
						
			
		end 
    end
        
	listen()

end

-- pedestrian traffic light sequences

function standardSequence()

	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	bottomLight(ped1)
	bottomLight(ped2)
	bottomLight(ped3)
	bottomLight(ped4)
	bottomLight(ped5)
	bottomLight(ped6)
	sleep(timeforgreen)
	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	topLight(ped1)
	topLight(ped2)
	topLight(ped3)
	topLight(ped4)
	topLight(ped5)
	topLight(ped6)
	
end

function blinkSequence()

	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	bottomLight(ped1)
	bottomLight(ped2)
	bottomLight(ped3)
	bottomLight(ped4)
	bottomLight(ped5)
	bottomLight(ped6)
	sleep(timeforgreen)
	
	redstone.setBundledOutput(bundleSide, colors.orange)
	
	i = timeforyellow
	
		while i > 0 do
			
			reset(ped1)
			reset(ped2)
			reset(ped3)
			reset(ped4)
			reset(ped5)
			reset(ped6)
			sleep(flashspeed)
			bottomLight(ped1)
			bottomLight(ped2)
			bottomLight(ped3)
			bottomLight(ped4)
			bottomLight(ped5)
			bottomLight(ped6)
			sleep(flashspeed)
						
			i = i - 1
		
		end
	
	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	topLight(ped1)
	topLight(ped2)
	topLight(ped3)
	topLight(ped4)
	topLight(ped5)
	topLight(ped6)
	
end

function sliderSequence()

	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	
	slider1(ped1)
	slider1(ped2)
	slider1(ped3)
	slider1(ped4)
	slider1(ped5)
	slider1(ped6)
	sleep(sliderSleep)
	
	slider2(ped1)
	slider2(ped2)
	slider2(ped3)
	slider2(ped4)
	slider2(ped5)
	slider2(ped6)
	sleep(sliderSleep)
	
	slider3(ped1)
	slider3(ped2)
	slider3(ped3)
	slider3(ped4)
	slider3(ped5)
	slider3(ped6)
	sleep(sliderSleep)

	slider4(ped1)
	slider4(ped2)
	slider4(ped3)
	slider4(ped4)
	slider4(ped5)
	slider4(ped6)	
	sleep(sliderSleep)

	slider5(ped1)
	slider5(ped2)
	slider5(ped3)
	slider5(ped4)
	slider5(ped5)
	slider5(ped6)
	sleep(sliderSleep)
	
	slider6(ped1)
	slider6(ped2)
	slider6(ped3)
	slider6(ped4)
	slider6(ped5)
	slider6(ped6)
	sleep(sliderSleep)
	
	slider7(ped1)
	slider7(ped2)
	slider7(ped3)
	slider7(ped4)
	slider7(ped5)
	slider7(ped6)
	sleep(sliderSleep)

	slider8(ped1)
	slider8(ped2)
	slider8(ped3)
	slider8(ped4)
	slider8(ped5)
	slider8(ped6)	
	sleep(sliderSleep)
	
	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	topLight(ped1)
	topLight(ped2)
	topLight(ped3)
	topLight(ped4)
	topLight(ped5)
	topLight(ped6)
	
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
	
	redstone.setBundledOutput(bundleSide, 0)
	sleep(0.5)
	redstone.setBundledOutput(bundleSide, colors.white)
	calculateSlider()
	
	reset(ped1)
	reset(ped2)
	reset(ped3)
	reset(ped4)
	reset(ped5)
	reset(ped6)
	topLight(ped1)
	topLight(ped2)
	topLight(ped3)
	topLight(ped4)
	topLight(ped5)
	topLight(ped6)
	
	listen()
	
end

start()
