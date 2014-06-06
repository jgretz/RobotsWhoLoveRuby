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

	def turn_on color, turn_off_others=true
		turn_all_off if turn_off_others

		@arduino.digital_write self.send(color), true
	end

	def turn_off color
		@arduino.digital_write self.send(color), false
	end

	def turn_all_off
		turn_off :red
		turn_off :yellow
		turn_off :green
	end

	def have_fun
		10.times do
			(1..3).to_a.sample.times do
				colors = [ :red, :yellow, :green ]

				turn_on colors.sample, false
			end
			sleep 0.65

			turn_all_off
		end

		puts "That's enough, I'm tired"
	end

end