function Selector()
	while true do
    mon = peripheral.wrap("back")
    mon.clear()
    print("Floor:")
    local input = read("*")
    
		if input == "2" then
			mon.setCursorPos(1,1)
			mon.write("Floor 2 Selected")
		end
	end
end

Selector()

