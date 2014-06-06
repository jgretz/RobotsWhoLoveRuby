require "require_all"
require_all "../Shared"
require_relative 'stoplight'

light = Stoplight.new

keyboard = KeyboardRobot.new
keyboard.add_handler 'r', lambda { light.turn_on :red }
keyboard.add_handler 'y', lambda { light.turn_on :yellow }
keyboard.add_handler 'g', lambda { light.turn_on :green }
keyboard.add_handler 'space', lambda { light.turn_all_off }
keyboard.add_handler 'q', lambda { light.have_fun }

Artoo::Robot.work!([keyboard])