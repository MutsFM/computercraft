local stationName = "Aktash"	-- Enter Station Name
local mcComputer = 1			-- Enter the computerID for the station's metro controller computer
local launcherComputer = 2		-- Enter the computerID for the station's metro launcher computer

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech MetroSys.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print(stationName.." Arrival OS Operating")

print("waiting")

while true do
    os.pullEvent("redstone")
    
    while (redstone.getInput("top")) do
        rednet.send(launcherComputer, stationName.."Arrival")
		rednet.send(mcComputer, stationName.."Arrival")
        sleep(5)
    end
    
end