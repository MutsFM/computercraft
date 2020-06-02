-- ArchiTech Traffic Lights
-- Pedestrian SoundOS
-- Touchscreen for SoundDemo

local monitorSide = "front"				-- Replace "right" with side to which the monitor is connected.

local speedBundle = "back"
local soundBundle = "left"

-- Color Customisation Options
	-- Floor Selection Screen
sbckc = colors.white				-- Screen background color. Replace 'white' with another color code.
ttxtc = colors.white				-- Color of the top text. Replace 'black' with another color code. 
txtc = colors.white				-- Color of the floor numbers. Replace 'white' with another color code.
fbckc = colors.red				-- Color of the background of the respective floor's number. Replace 'red' with another color code.
bckc = colors.black				-- Color of the background of the other floor numbers. Replace 'black' with another color code.

sfc = colors.black

	-- Screen with Selection Confirmation
csbckc = colors.black				-- Screen background color. Replace 'black' with another color code.
cstextc = colors.white				-- Color of the text on the selection confirmation screen. Replace 'white' with another color code.

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local floor = "Floor1" 				-- Replace "Floor1" with corresponding floor number, e.g. "Floor6". Groundfloor should be added as "Floor0".

local speed = "off"
redstone.setBundledOutput(speedBundle, 0)

mon = peripheral.wrap(monitorSide)

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech Elevator Inc.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Touchscreen Operating Software")
print("Operating for: Sound Demo")



function screen()
while true do
    mon.setBackgroundColor(sbckc)	
    mon.clear()
    mon.setTextScale(1)
	mon.setBackgroundColor(colors.gray)
    mon.setTextColor(ttxtc)
	mon.setCursorPos(1,1)
	mon.write("  Traffic Lights  ")
    mon.setCursorPos(1,2)
    mon.write("    Sound Demo    ")
	
	mon.setBackgroundColor(sbckc)
	mon.setTextColor(sfc)
    mon.setCursorPos(4,4)
    mon.write("Select Sound:")
    
    mon.setBackgroundColor(bckc)			
    mon.setTextColor(txtc)
     
-- ROW 1
    mon.setCursorPos(1,6)
    if floor == "Floor1" then
    	mon.setBackgroundColor(fbckc)		
	mon.write("High Click")					--Extra spacing for aesthetic purposes
        mon.setBackgroundColor(bckc)
    else
       mon.write("High Click")					
    end
    
    mon.setCursorPos(9,7)
    if floor == "Floor2" then
    	mon.setBackgroundColor(fbckc)		
	mon.write(" Mid Click")					
        mon.setBackgroundColor(bckc)
    else
       mon.write(" Mid Click")					
    end
    
    mon.setCursorPos(1,8)
    if floor == "Floor3" then
    	mon.setBackgroundColor(fbckc)		
	mon.write("Low Click")					
        mon.setBackgroundColor(bckc)
    else
       mon.write("Low Click")					
    end
    
    mon.setCursorPos(7,9)
    if floor == "Floor4" then
    	mon.setBackgroundColor(fbckc)		
	mon.write(" Lower Click")					
        mon.setBackgroundColor(bckc)
    else
       mon.write(" Lower Click")					
    end
    
    mon.setCursorPos(1,10)
    if floor == "Floor5" then
    	mon.setBackgroundColor(fbckc)		
	mon.write("  Bell   ")					
        mon.setBackgroundColor(bckc)
    else
       mon.write("  Bell   ")					
    end
    
-- ROW 2
    mon.setCursorPos(10,11)
    if floor == "Floor6" then
    	mon.setBackgroundColor(fbckc)		
		mon.write("   Plop  ")					
        mon.setBackgroundColor(bckc)
    else
       mon.write("   Plop  ")					
    end
    
    mon.setCursorPos(1,12)
    if floor == "Floor7" then
    	mon.setBackgroundColor(fbckc)		
		mon.write("Nonsense #1")					
        mon.setBackgroundColor(bckc)
    else
       mon.write("Nonsense #1")					
    end
    
    mon.setCursorPos(7,13)
    if floor == "Floor8" then
    	mon.setBackgroundColor(fbckc)		
		mon.write(" Nonsense #2")					
        mon.setBackgroundColor(bckc)
    else
       mon.write(" Nonsense #2")					
    end
    
    mon.setCursorPos(1,14)
    if floor == "Floor9" then
    	mon.setBackgroundColor(fbckc)		
		mon.write("Nonsense #3")					
        mon.setBackgroundColor(bckc)
    else
       mon.write("Nonsense #3")					
    end
    
    mon.setCursorPos(7,15)
    if floor == "Floor10" then
    	mon.setBackgroundColor(fbckc)		
		mon.write(" Nonsense #4")					
        mon.setBackgroundColor(bckc)
    else
       mon.write(" Nonsense #4")					
    end
	
	mon.setBackgroundColor(sbckc)
	mon.setTextColor(sfc)
    mon.setCursorPos(4,17)
	mon.write("Select Light:")
	
	mon.setCursorPos(1,18)
	mon.setBackgroundColor(colors.red)
	mon.setTextColor(colors.gray)
	if speed == "red" then
		mon.setTextColor(colors.black)
		mon.write(" Red ")
		mon.setTextColor(colors.gray)
	else 
		mon.write(" Red ")
	end
	
	mon.setCursorPos(6,18)
	mon.setBackgroundColor(colors.green)
	if speed == "green" then
		mon.setTextColor(colors.black)
		mon.write(" Green ")
		mon.setTextColor(colors.gray)
	else 
		mon.write(" Green ")
	end
	
	mon.setCursorPos(13,18)
	mon.setBackgroundColor(colors.yellow)
	if speed == "yellow" then
		mon.setTextColor(colors.black)
		mon.write(" Blink ")
		mon.setTextColor(colors.gray)
	else 
		mon.write(" Blink ")
	end
	
	mon.setCursorPos(1,19)
	mon.setBackgroundColor(colors.black)
	if speed == "off" then
		mon.setTextColor(colors.white)
		mon.write("        Off       ")
		mon.setTextColor(colors.gray)
	else
		mon.write("        Off       ")		
	end
	
    
    
    listen()
end
end
 
function listen()
    event, side, x, y = os.pullEvent("monitor_touch")
    
    mon.setBackgroundColor(csbckc) 
    mon.setTextColor(cstextc)
    
    if x > 0 and x < 11 and y == 6 then
        floor = "Floor1"
		redstone.setBundledOutput(soundBundle, 1)
      end
    if x > 8 and x < 19 and y == 7 then
        floor = "Floor2"
		redstone.setBundledOutput(soundBundle, 2)
        end
    if x > 0 and x < 10 and y == 8 then
        floor = "Floor3"
		redstone.setBundledOutput(soundBundle, 4)
        end
    if x > 6 and x < 19 and y == 9 then
        floor = "Floor4" 
		redstone.setBundledOutput(soundBundle, 8)
        end
    if x > 0 and x < 10 and y == 10 then
        floor = "Floor5"
		redstone.setBundledOutput(soundBundle, 16)
        end
    if x > 9 and x < 19 and y == 11 then
        floor = "Floor6"
		redstone.setBundledOutput(soundBundle, 32)
        end
	
    if x > 0 and x < 12 and y == 12 then
        floor = "Floor7"
		redstone.setBundledOutput(soundBundle, 64)
        end
	
	if x > 6 and x < 19 and y == 13 then
        floor = "Floor8"
		redstone.setBundledOutput(soundBundle, 128)
        end

	if x > 0 and x < 12 and y == 14 then
        floor = "Floor9"
		redstone.setBundledOutput(soundBundle, 256)
        end	

	if x > 6 and x < 19 and y == 15 then
        floor = "Floor10"
		redstone.setBundledOutput(soundBundle, 512)
        end	
		
	if x > 0 and x < 6 and y == 18 then
        speed = "red"
		redstone.setBundledOutput(speedBundle, 1)
        end	
	
	if x > 5 and x < 13 and y == 18 then
        speed = "green"
		redstone.setBundledOutput(speedBundle, 16)
        end	
		
	if x > 12 and x < 19 and y == 18 then
        speed = "yellow"
		redstone.setBundledOutput(speedBundle, 2)
        end	
	
	if x > 0 and x < 19 and y == 19 then
        speed = "off"
		redstone.setBundledOutput(speedBundle, 0)
        end	
	

    screen()
end


function start()
    screen()
end

start()
