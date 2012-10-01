require 'forwardable'
module GoldenDelicious
	class Device
		extend Forwardable
		def_delegators :@serial_number, :to_s
		def_delegators :@model, :memory, :storage, :identifiers
		def initialize serial_number
			@serial_number = SerialNumber.new serial_number
			@model = Model.new @serial_number.model
		end
	end
end