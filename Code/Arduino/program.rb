require 'artoo'
require_relative 'stoplight'

# hardware setup 
# light = Stoplight.new

# artoo connection and device hash
connection :keyboard, adaptor: :keyboard
device :keyboard, driver: :keyboard, connection: :keyboard

# work loop
should_quit = false

work do
  on keyboard, :key => :keypress

  # exit loop
  puts should_quit

  if should_quit then
  	# light.turn_all_off
  	break
  end 
end

def keypress(sender, key)
	case key
		when "q"
			should_quit = true
		else
			puts key
		end
	end

	# case 'r'
	# 	light.turn_on :red

	# case 'y'
	# 	light.turn_on :yellow

	# case 'g'
	# 	light.turn_on :green
end