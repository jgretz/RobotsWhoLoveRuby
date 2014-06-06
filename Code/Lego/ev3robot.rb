require 'rubygems'
require 'ev3'
require 'ev3/connections/bluetooth'

class Ev3Bot
	attr_accessor :brick, :left_leg, :right_leg, :gun
	attr_accessor :left_forward, :right_forward

	def initialize
		@brick = EV3::Brick.new(EV3::Connections::Bluetooth.new)
		@brick.connect

		puts "Connected"

		@left_leg = brick.motor('b')
		@right_leg = brick.motor('c')
		@gun = brick.motor('a')

		@left_leg.speed = 20
		@right_leg.speed = 20
		@gun.speed = 30

		@left_forward = true
		@right_forward = true
	end

	def disconnect
		self.brick.disconnect
	end

	# gun
	def shoot num_balls
		self.gun.start
		sleep num_balls * 2.2
		self.gun.stop
	end

	# beep
	def beep
		self.brick.beep
	end

	# movement
	def turn_left
		reverse_left_leg if left_forward
		reverse_right_leg unless right_forward
		
		run
	end

	def turn_right
		reverse_left_leg unless left_forward
		reverse_right_leg if right_forward

		run
	end

	def reverse
		reverse_left_leg if left_forward
		reverse_right_leg if right_forward

		run
	end

	def forward
		reverse_left_leg unless left_forward
		reverse_right_leg unless right_forward

		run
	end

	def stop
		self.left_leg.stop
		self.right_leg.stop
	end

	def run
		self.stop

		self.left_leg.start
		self.right_leg.start
	end

	def reverse_left_leg
		self.left_leg.reverse

		self.left_forward = self.left_forward ? false : true
	end

	def reverse_right_leg
		self.right_leg.reverse

		self.right_forward = self.right_forward ? false : true
	end
end