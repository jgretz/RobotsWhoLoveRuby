require "artoo"
require_relative "keyboardcontrol"
require_relative "spherocontrol"

# define connections
connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-YOR-AMP-SPP'
device :sphero, :driver => :sphero

connection :keyboard, adaptor: :keyboard
device :keyboard, driver: :keyboard, connection: :keyboard

work do
	c = KeyboardControl.new
	on keyboard, :key => lambda {|x,y| c.keypress(x,y) }

	sc = SpheroControl.new sphero
	c.add_listener sc
	
end