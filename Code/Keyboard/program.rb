require "require_all"
require_all "../Shared"

keyboard = KeyboardRobot.new
keyboard.add_handler 'q', lambda { puts 'You hit q' }

Artoo::Robot.work!([keyboard])