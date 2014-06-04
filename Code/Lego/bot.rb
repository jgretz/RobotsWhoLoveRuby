require 'rubygems'
require 'ev3'
require 'ev3/connections/bluetooth'

class Ev3Bot
	attr_accessor :brick, :left_leg, :right_leg, :gun

	def initialize
		@brick = EV3::Brick.new(EV3::Connections::Bluetooth.new)
		@brick.connect

		puts "Connected"

		@left_leg = brick.motor('b')
		@right_leg = brick.motor('c')
		@gun = brick.motor('a')

		@left_leg.speed = 20
		@right_leg.speed = 20
		gun.speed = 30
	end

	def turn_left time
		puts "Turning Left"

		self.left_leg.reverse

		self.run time

		self.left_leg.reverse
	end

	def turn_right time
		puts "Turning Right"

		self.right_leg.reverse

		self.run time

		self.right_leg.reverse
	end

	def run time
		self.left_leg.start
		self.right_leg.start

		sleep(time)

		self.stop
	end

	def stop
		self.left_leg.stop
		self.right_leg.stop
	end

	def empty_clip
		puts "Do ya feel lucky punk"

		self.gun.start
		sleep(8)
		self.gun.stop
	end

	def disconnect
		self.brick.disconnect
	end
end

bot = Ev3Bot.new

bot.empty_clip
bot.turn_left 10
bot.turn_right 10

bot.stop
bot.disconnect

puts "Goodbye"