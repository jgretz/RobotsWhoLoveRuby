require 'sphero'

class SpheroRobot
	attr_accessor :sphero, :speed
	attr_accessor :blue, :red, :green, :yellow, :white

	def initialize
		puts "Connecting to Sphero ..."

		@sphero = Sphero.new "/dev/tty.Sphero-YOR-AMP-SPP"
		@speed = 100
		define_colors

		raise "Unable to connect to Sphero !!!" unless test_connection

		change_color :white
		puts "Connected to Sphero ..."
	end
	
	def change_color color
		color_array = self.send(color)
		return unless color_array

		sphero.rgb color_array[0], color_array[1], color_array[2], true
	end

	def roll degrees
		sphero.roll speed, degrees
	end

	def stop
		sphero.stop
	end

	def test_connection
		5.times do
			response = sphero.ping
			return true if response
			sleep 0.1
		end

		return false
	end

	def define_colors
		@blue = [0,0,255]
		@red = [255,0,0]
		@green = [0,255,0]
		@yellow = [255,255,0]
		@white = [255,255,255]
	end
end