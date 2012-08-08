require 'golden_delicious/version'
require 'golden_delicious/stats'
require 'httparty'
require 'json'
require 'memoist'
require 'nokogiri'

class GoldenDelicious
	include HTTParty
	extend Memoist
	def initialize dirty_serial_number
		# Some USB scanners prepend an 'S' to every Apple serial number. This does not happen
		# with other serial numbers, so I'm assuming it has something to do with the way Apple
		# prints their serial number barcodes. Anyhow, Apple will reject a serial number with
		# the 'S', so I better remove it.
		dirty_serial_number.slice! 0 if dirty_serial_number[0] == 'S'
		@sn = dirty_serial_number
	end

	# Use Apple's warranty checking web service to determine if a serial number is valid.
	def valid?
		dirty_response = self.class.get 'https://selfsolve.apple.com/warrantyChecker.do', :query => {:sn => @sn}
		
		# Apple's web service for checking the validity of a serial number returns a JSON
		# payload wrapped in a javascript function call: null(). The magic numbers in the
		# array slice below remove the function call since the JSON module does not know
		# to deal with it.
		response = JSON.parse dirty_response.body[5..-2]

		# Most of the keys in the response are all CAPS, which is just rude.
		# TODO: Find a cleaner way of modifying Hash keys.
		response = Hash[response.map {|k, v| [k.downcase, v]}]

		# Apple returns an error hash if unable to find the serial number.
		# TODO: So far I have not seen an error key returned if the serial number was located. This may
		# change in the future. Find some more reliable key in the valid serial number response.
		!response.has_key?('error_code')
	end

	# Apple's SelfSolve can take a long time to respond.
	memoize :valid?

	# Return this serial numer from whence it came (a String)
	def to_s
		@sn
	end
end