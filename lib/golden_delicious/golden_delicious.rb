require 'forwardable'
module GoldenDelicious
	class GoldenDelicious
		extend Forwardable
		def_delegators :@everymac_info, :memory, :storage, :identifiers
		def initialize dirty_serial_number
			# Some USB scanners prepend an 'S' to every Apple serial number. This does not happen
			# with other serial numbers, so I'm assuming it has something to do with the way Apple
			# prints their serial number barcodes. Anyhow, Apple will reject a serial number with
			# the 'S', so I better remove it.
			dirty_serial_number.slice! 0 if dirty_serial_number[0] == 'S'

			@serial_number = dirty_serial_number

			# Apple embeds a short model number into every serial number. Serial numbers 11 digits
			# long have 3 digits ids, and 12 digit serial numbers have a 4 digit id. This id is used
			# by Everymac.
			short_model = dirty_serial_number[-4..-1]
			short_model.slice! 0 if dirty_serial_number.length == 11

			@everymac_info = Model.new short_model
		end
		def to_s
			@serial_number
		end
		def valid?
			true
		end
	end
end