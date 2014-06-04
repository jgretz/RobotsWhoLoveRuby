#ls /dev/tty.Sphero* to find sphero

class SpheroControl
	attr_accessor :robot, :commands, :speed

	def initialize robot
		self.robot = robot
		self.speed = 50

		define_commands
	end

	def handle_command command
		return false unless self.commands.has_key? command

		self.commands[command].call

		true
	end

	def define_commands
		self.commands = {
			"b" => lambda { change_color :blue },
			"g" => lambda { change_color :green },
			"r" => lambda { change_color :red },

			"space" => lambda { stop },
			"left" => lambda { roll 90 },
			"right" => lambda { roll 270},
			"up" => lambda { roll 180 },
			"down" => lambda { roll 0 }
		}
	end

	# sphero wrappers
	def change_color color
		self.robot.set_color color
	end

	def stop
		self.robot.stop
	end

	def roll direction
		self.robot.roll self.speed, direction
	end
end