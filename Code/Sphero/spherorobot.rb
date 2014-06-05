require 'artoo/robot'
require 'artoo'

class SpheroRobot < Artoo::Robot
	# artoo setup
	connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-YOR-AMP-SPP'
	device :sphero, :driver => :sphero

	work do
		on sphero, :handle_collision_detect => lambda {|data| puts "Ouch" }
	end

	# class
	attr_accessor :speed

	def initialize
		self.speed = 50
	end
	
	def change_color color
		sphero.set_color color
	end

	def stop
		sphero.stop
	end

	def roll direction
		sphero.roll self.speed, direction
	end
end