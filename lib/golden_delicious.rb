require 'golden_delicious/version'
require 'httparty'
require 'json'

class GoldenDelicious
	include HTTParty
	def initialize dirty_serial_number
		@sn = dirty_serial_number
		@valid = nil
	end

	# Use Apple's warranty checking web service to determine if a serial number is valid.
	def valid?
		dirty_response = self.class.get 'https://selfsolve.apple.com/warrantyChecker.do', :sn => @sn
		
		# Apple's web service for checking the validity of a serial number returns a JSON
		# payload wrapped in a javascript function call: null(). The magic numbers in the
		# array slice below remove the function call since the JSON module does not know
		# to deal with it.
		response = JSON.parse dirty_response.body[5..-2]

		# Most of the keys in the response are all CAPS, which is just rude.
		# TODO: Find a cleaner way of modifying Hash keys.
		response = Hash[response.map {|k, v| [k.downcase, v]}]

		false
	end
end