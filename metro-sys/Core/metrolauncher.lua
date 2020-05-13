local stationName = "Aktash"	-- Enter Station Name

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************



term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech MetroSys.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print(stationName.." Launcher OS Operating")

redstone.setOutput("top", true)

function receive()

    senderID, message = rednet.receive()
    
    if message==(stationName.."Arrival") then
        -- print("message received")
        redstone.setOutput("top", false)
        -- print("going to sleep")
        sleep(15)
        redstone.setOutput("top", true)
        -- print("Slept well")
    end
    
    restart()
end

function restart()
    -- print("restartin")
    receive()
end

restart()
    
