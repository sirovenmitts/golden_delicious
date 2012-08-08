module GoldenDelicious
	class Serial
		attr_reader :manufactured_at, :manufacture_year, :manufacture_week, :unique_identifier, :model
		def initialize sanitized_serial_number
			if sanitized_serial_number.length == 11
				parts = /(..)(.)(..)(...)(...)/.match sanitized_serial_number
			elsif sanitized_serial_number.length == 12
				parts = /(...)(.)(.)(...)(....)/.match sanitized_serial_number
			else
				raise 'Apple serial numbers are 11 or 12 digits long.'
			end
			@manufactured_at = parts[1]
			@manufacture_year = parts[2]
			@manufacture_week = parts[3]
			@unique_identifier = parts[4]
			@model = parts[5]
			@serial_number = sanitized_serial_number
		end
		def valid?
			true
		end
	end
end