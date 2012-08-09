require 'forwardable'
module GoldenDelicious
	class GoldenDelicious
		extend Forwardable
		def_delegators :@apple_info, :to_s, :valid?
		def_delegators :@everymac_info, :memory, :storage, :identifiers
		def initialize dirty_serial_number
			# Some USB scanners prepend an 'S' to every Apple serial number. This does not happen
			# with other serial numbers, so I'm assuming it has something to do with the way Apple
			# prints their serial number barcodes. Anyhow, Apple will reject a serial number with
			# the 'S', so I better remove it.
			dirty_serial_number.slice! 0 if dirty_serial_number[0] == 'S'

			@apple_info = AppleInfo.new dirty_serial_number
			@everymac_info = Stats.new 'Z5W'
		end
	end
end