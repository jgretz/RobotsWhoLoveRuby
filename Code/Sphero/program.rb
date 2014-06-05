require "require_all"
# require_all "../Shared"
require_relative "spherorobot"

ball = SpheroRobot.new
puts ball

ball.change_color :blue

# keyboard = KeyboardRobot.new

# keyboard.add_handler "b", lambda { sphero.change_color :blue }
# keyboard.add_handler "r", lambda { sphero.change_color :red }
# keyboard.add_handler "y", lambda { sphero.change_color :yellow }
# keyboard.add_handler "g", lambda { sphero.change_color :green }

# keyboard.add_handler "space", lambda { sphero.stop }
# keyboard.add_handler "up", lambda { sphero.roll 180 }
# keyboard.add_handler "down", lambda { sphero.roll 0 }
# keyboard.add_handler "left", lambda { sphero.roll 90 }
# keyboard.add_handler "right", lambda { sphero.roll 270 }

Artoo::Robot.work!([ ball ])