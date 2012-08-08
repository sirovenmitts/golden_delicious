require 'spec_helper'
require 'golden_delicious'

describe GoldenDelicious do
	it 'should validate valid serial numbers' do
		valid = GoldenDelicious.new 'W8734T8GZ5W'
		valid.valid?.should eq true
	end
	it 'should not validate invalid serial numbers' do
		invalid = GoldenDelicious.new 'W88401231AX'
		invalid.valid?.should eq false
	end
	it 'should remove the superfluous "S" prepended by some serial number scanners' do
		sn = GoldenDelicious.new 'SW88401231AX'
		sn.to_s.should eq 'W88401231AX'
	end
end