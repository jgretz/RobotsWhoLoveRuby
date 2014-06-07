require "require_all"
require_all "../Shared"
require_relative "ev3robot"

bot = Ev3Bot.new
keyboard = KeyboardRobot.new

keyboard.add_handler "b", lambda { bot.beep }
keyboard.add_handler "s", lambda { bot.shoot 1 }

keyboard.add_handler "d", lambda { bot.disconnect }

keyboard.add_handler "space", lambda { bot.stop }

keyboard.add_handler "up", lambda { bot.forward }
keyboard.add_handler "down", lambda { bot.reverse }
keyboard.add_handler "left", lambda { bot.turn_left }
keyboard.add_handler "right", lambda { bot.turn_right }

bot.stop
Artoo::Robot.work!([keyboard])