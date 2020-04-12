term.clear()
term.setCursorPos(16,1)
print("MutsFM Elevator Inc.")
term.setCursorPos(1,4)
print("Cart Dispenser Operating")

function receive()
    senderID, message = rednet.receive()
    if message==("Cart")
        then
            redstone.setOutput("left", true)
			sleep(2)
			redstone.setOutput("left", false)
    end
    restart()
end

function restart()
receive()
end

restart()
