require 'artoo'
require 'singleton'

class KeyboardListener
	include Singleton

	attr_accessor :on_keypress

	def keypress sender, key
		on_keypress key
	end
end

# artoo functional setup
connection :keyboard, adaptor: :keyboard
device :keyboard, driver: :keyboard, connection: :keyboard

work do
	on keyboard, :key => lambda {|sender,key| KeyboardListener.instance.keypress(sender,key) }
end