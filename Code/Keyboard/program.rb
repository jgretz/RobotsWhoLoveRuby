require_relative '../Shared/keyboardrobot'

keyboard = KeyboardRobot.new
keyboard.add_handler 'q', lambda { puts 'You hit q' }

Artoo::Robot.work!([keyboard])