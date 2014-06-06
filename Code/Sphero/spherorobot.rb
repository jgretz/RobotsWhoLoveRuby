require 'artoo/robot'

class SpheroRobot < Artoo::Robot
	# artoo setup
	connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-YOR-AMP-SPP'
	device :sphero, :driver => :sphero

	work do
		sphero.set_color :red
	end

	# class
	attr_accessor :speed, :bot

	def initialize
		self.speed = 50
	end
	
	def change_color color
		bot.set_color color
	end

	def stop
		bot.stop
	end

	def roll direction
		bot.roll self.speed, direction
	end
end