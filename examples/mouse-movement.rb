require 'uinput/device'

device = Uinput::Device.new do
	# Capabillities that will not be used, but must be present
	self.add_event(:EV_KEY)
	self.add_button(:BTN_LEFT)

	self.add_event(:EV_REL)
	self.add_relative(:REL_X)
	self.add_relative(:REL_Y)
	self.add_event(:EV_SYN)
end

moves = 0
while sleep(1)
	moves += 1
	if moves > 7 then break end
	device.send_event(:EV_REL, :REL_X, 50)
	device.send_event(:EV_REL, :REL_Y, 50)
	device.send_event(:EV_SYN, :SYN_REPORT)
end

device.destroy
