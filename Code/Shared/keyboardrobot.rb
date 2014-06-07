require 'artoo/robot'

class KeyboardRobot < Artoo::Robot
	# artoo setup
	connection :keyboard, adaptor: :keyboard
	device :keyboard, driver: :keyboard, connection: :keyboard

	work do
		on keyboard, :key => :keypress
	end

	# class
	attr_accessor :handlers
	def initialize
		@handlers = {}

		super
	end

	def add_handler key, logic
		handlers[key] = logic
	end

	def keypress sender, key
		handlers[key].call if handlers.has_key? key
	end
end