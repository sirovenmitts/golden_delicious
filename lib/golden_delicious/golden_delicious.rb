require 'forwardable'
module GoldenDelicious
	class GoldenDelicious
		extend Forwardable
		def_delegators :@apple_info, :to_s, :valid?
		def_delegators :@everymac_info, :memory, :storage, :identifiers
		def initialize dirty_serial_number
			sanitized_serial_number = dirty_serial_number
			@apple_info = AppleInfo.new sanitized_serial_number
			@everymac_info = Stats.new 'Z5W'
		end
	end
end