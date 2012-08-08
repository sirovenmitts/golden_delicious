require 'spec_helper'
require 'golden_delicious'

describe GoldenDelicious do
	it 'should validate serial numbers' do
		sn = GoldenDelicious.new 'W88401231AX'
		sn.valid?.should eq false
		# TODO: Get a hold of a valid serial number and validate it here
	end
end