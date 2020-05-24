monitorSide = "right"				-- Replace "right" with side to which the monitor is connected.

-- Floorplan Information

local buildingName = "ArchiTech HQ"
local buildingNamePos = 4 -- See table in readme for positions.

-- Color Customisation Options

sbckc = colors.white				-- Screen background color. Replace 'white' with another color code.
ttxtc = colors.black				-- Color of the top text. Replace 'black' with another color code. 
fbckc = colors.black				-- Color of the background of the floors. Replace 'black' with another color code.
ftxtc = colors.white				-- Color of the text of the floors. Replace 'white' with another color code.
ebckc = colors.white				-- Color of the background of the floors' explanation. Replace 'white' with another color code.
etxtc = colors.black				-- Color of the text of the floors' explanation. Replace 'black' with another color code.
mbckc = colors.black				-- Color of the background of the menu buttons. Replace 'black' with another color code.
mtxtc = colors.white				-- Color of the text of the menu buttons. Replace 'white' with another color code.



-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

mon = peripheral.wrap(monitorSide)

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech Elevator Inc.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Floorplan Software")
print("Version for 6 floors, fully interactive")

function homescreen()

	mon.setBackgroundColor(sbckc)
	mon.clear()
	mon.setCursorPos(buildingNamePos, 2)
	mon.setTextColor(ttxtc)
	mon.write(buildingName)
	mon.setCursorPos(5,3)
	mon.write("Floor Plan")
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,5)
	mon.write(" Ground Floor")
	mon.setBackgroundColor(ebckc)
	mon.setTextColor(etxtc)
	mon.setCursorPos(3,6)
	mon.write("Shops")
	mon.setBackgroundColor(colors.black)
	mon.setTextColor(colors.white)
	mon.setCursorPos(1,8)
	mon.write("Floor 1")
	mon.setBackgroundColor(colors.white)
	mon.setTextColor(colors.black)
	mon.setCursorPos(3,9)
	mon.write("Gashi Inc.")
	mon.setBackgroundColor(colors.black)
	mon.setTextColor(colors.white)
	mon.setCursorPos(1,11)
	mon.write("Floor 2")
	mon.setBackgroundColor(colors.white)
	mon.setTextColor(colors.black)
	mon.setCursorPos(3,12)
	mon.write("Xheladini & Son")
	mon.setBackgroundColor(colors.black)
	mon.setTextColor(colors.white)
	mon.setCursorPos(1,14)
	mon.write("Floors 3 - 6")
	mon.setBackgroundColor(colors.white)
	mon.setTextColor(colors.black)
	mon.setCursorPos(3,15)
	mon.write("Residences")
	mon.setBackgroundColor(colors.black)
	mon.setTextColor(colors.white)
	mon.setCursorPos(1,17)
	mon.write("Floor 7")
	mon.setBackgroundColor(colors.white)
	mon.setTextColor(colors.black)
	mon.setCursorPos(3,18)
	mon.write("MutsFM Elevators Inc.")

end

homescreen()






