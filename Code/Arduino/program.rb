require 'require_all'
require_all 'lib'
require_all '../Shared'
 
light = Stoplight.new

last_key = ''
KeyboardListener.instance.on_keypress = lambda {|key| last_key = key }

commands = {
	"r" => lambda { light.turn_on :red },
	"y" => lambda { light.turn_on :yellow },
	"g" => lambda { light.turn_on :green }
}

5.times do
	puts commands.has_key? last_key unless last_key.empty?

	light.turn_on :red
	sleep 1

	light.turn_on :yellow
	sleep 1

	light.turn_on :green
	sleep 1
end

light.turn_all_off