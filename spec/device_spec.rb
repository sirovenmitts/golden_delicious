require 'spec_helper'
require 'golden_delicious'

describe GoldenDelicious::Device do
	# In the interest of not repeating tests I am only going to test
	# 1 value from the Stats object; if you want to know if the Stats
	# object works, visit stats_spec.rb.
	# NOTE: This could be a bad idea, since this is technically not
	# testing the Stats object, but rather delegation.
	it 'should delegate to the Model and Serial Number' do
		device = GoldenDelicious::Device.new 'W8734T8GZ5W'
		device.identifiers.model.should eq 'A1181'

		device.to_s.should eq 'W8734T8GZ5W'
	end
end