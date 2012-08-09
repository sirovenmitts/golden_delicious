require 'spec_helper'
require 'golden_delicious/apple_info'

describe GoldenDelicious::AppleInfo do
	it 'should validate valid serial numbers' do
		valid = GoldenDelicious::AppleInfo.new 'W8734T8GZ5W'
		valid.valid?.should eq true
	end
	it 'should not validate invalid serial numbers' do
		invalid = GoldenDelicious::AppleInfo.new 'W88401231AX'
		invalid.valid?.should eq false
	end
end