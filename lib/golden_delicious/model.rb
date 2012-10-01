require 'open-uri'
require 'nokogiri'

module GoldenDelicious
	Memory = Struct.new :slots, :max, :type, :speed
	Storage = Struct.new :interface, :original_size
	Identifiers = Struct.new :model, :family, :sub_family, :emc, :order

	class Model
		attr_reader :memory, :storage, :identifiers
		def initialize short_model
			search_results = Nokogiri::HTML open('http://everymac.com/ultimate-mac-lookup/?search_keywords=%s' % short_model)

			specs_page = Nokogiri::HTML open('http://everymac.com/' + search_results.css('.detail_title:first-child a').first['href'])

			# Fetch the memory stats.
			type, speed = specs_page.css '#specs9-title td:nth-child(even)'
			max = specs_page.css('#specs10-title td:last-child').first.content[/^(\d+)/].to_i
			slots = specs_page.css('#specs11-title td:last-child').first.content.to_i
			@memory = Memory.new slots, max, type.content, speed.content

			# Fetch the storage stats.
			original_size, interface = specs_page.css '#specs16-title td:nth-child(even)'
			@storage = Storage.new interface.content, original_size

			# And for my final act of the evening: Fetch the identifiers.
			order, sub_family = specs_page.css '#specs24-title td:nth-child(even)'
			model_emc_tuple, family = specs_page.css '#specs25-title td:nth-child(even)'
			model = model_emc_tuple.content[/(\w+)/]
			emc = model_emc_tuple.content[/\s(\d+)/, 1]
			@identifiers = Identifiers.new model, family.content, sub_family.content, emc, order.content
		end
	end
end