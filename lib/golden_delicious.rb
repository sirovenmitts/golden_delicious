require 'golden_delicious/version'
require 'httparty'
require 'json'

class GoldenDelicious
	include HTTParty
	base_uri 'https://selfsolve.apple.com'
	def initialize dirty_serial_number
		@sn = dirty_serial_number
		@valid = nil
	end
	def valid?
		response = JSON.parse self.class.get('/warrantyChecker.do', :sn => @sn).body[5..-2]
		false
	end
end