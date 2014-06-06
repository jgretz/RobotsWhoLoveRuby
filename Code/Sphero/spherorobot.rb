require 'sphero'

class SpheroRobot
	attr_accessor :sphero, :speed
	attr_accessor :blue, :red, :green, :yellow

	def initialize
		puts "Connecting to Sphero ..."
		@sphero = Sphero.new "/dev/tty.Sphero-YOR-AMP-SPP"
		@sphero.ping

		@speed = 50

		#colors
		@blue = [0,0,255]
		@red = [255,0,0]
		@green = [0,255,0]
		@yellow = [255,255,0]
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
end