require 'httparty'
require 'json'
require 'open-uri'

module GoldenDelicious
	class AppleInfo
		def initialize serial_number
			@sn = serial_number

			dirty_response = open('https://selfsolve.apple.com/warrantyChecker.do?sn=%s' % @sn).string
			
			# Apple's web service for checking the validity of a serial number returns a JSON
			# payload wrapped in a javascript function call: null(). The magic numbers in the
			# array slice below remove the function call since the JSON module does not know
			# to deal with it.
			response = JSON.parse dirty_response[5..-2]

			# Most of the keys in the response are all CAPS, which is just rude.
			# TODO: Find a cleaner way of modifying Hash keys.
			response = Hash[response.map {|k, v| [k.downcase, v]}]

			# Apple returns an error hash if unable to find the serial number.
			# TODO: So far I have not seen an error key returned if the serial number was located. This may
			# change in the future. Find some more reliable key in the valid serial number response.
			@valid = !response.has_key?('error_code')

			# Apple provides a whole bunch of information if the serial number is valid.
			if valid?
				@in_warranty = response['hw_has_coverage'] == "Y" ? true : false
				@has_applecare = response['hw_has_app'] == "Y" ? true : false
			end
		end
		def valid?
			@valid
		end
		def in_warranty?
			@in_warranty || false
		end
		def has_applecare?
			@has_applecare || false
		end

		# Return this serial numer from whence it came (a String)
		def to_s
			@sn
		end
	end
end