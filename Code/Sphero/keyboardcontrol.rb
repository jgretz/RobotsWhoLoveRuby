require "rubygems"
require "arduino_firmata"

class KeyboardControl
	attr_accessor :listeners, :command

	def initialize
		self.listeners = []
		self.command = ''
	end

	def add_listener listener
		self.listeners << listener
	end

	def keypress(sender, key)
		@command += key

		if key == "`"
			@command = ""			
			return
		end

		handle_command
	end

	def handle_command
		handled = self.listeners.select { |l| l.handle_command self.command  }

		self.command = '' unless handled.empty?
	end
end