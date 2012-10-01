module GoldenDelicious
	# SerialNumber parses an Apple serial number (old and new style).
	class SerialNumber
		attr_reader :location, :year, :week, :id, :model
		def initialize serial_number
			serial_number.slice! 0 if serial_number[0].downcase == 's'
			if serial_number.length == 11
				regex = /(..)(.)(..)(...)(...)/i
			elsif serial_number.length == 12
				regex = /(...)(.)(.)(...)(....)/i
			end
			_, @location, @year, @week, @id, @model = regex.match(serial_number).to_a
		end
		def to_s
			[@location, @year, @week, @id, @model].join ''
		end
	end
end
