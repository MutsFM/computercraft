local pcLeft = 1				-- Enter the computerID of the metro controller comupter at the previous station
local pcRight = 2				-- Enter the computerID of the metro controller computer at the next station


-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************


term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech MetroSys.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Repeater OS Operating")

function receive()

	senderID, message = rednet.receive()
	
	if senderID == pcLeft then
		rednet.send(pcRight, message)
	end
	
	if senderID == pcRight then
		rednet.send(pcLeft, message)
	end
	
	restart()

end

function restart()

	receive()

end

restart()
