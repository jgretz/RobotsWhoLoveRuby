require 'rubygems'
require 'arduino_firmata'

class Stoplight
	attr_accessor :arduino, :red, :yellow, :green

	def initialize
		@red = 12
		@yellow = 11
		@green = 10

		puts "Connecting to Arduino Device"
		@arduino = ArduinoFirmata.connect
		puts "Connected to Arduino Device"
	end

	def turn_on color
		self.turn_all_off

		@arduino.digital_write self.send(color), true
	end

	def turn_off color
		@arduino.digital_write self.send(color), false
	end

	def turn_all_off
		self.turn_off :red
		self.turn_off :yellow
		self.turn_off :green
	end

end