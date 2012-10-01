require 'spec_helper'
require 'golden_delicious/serial_number.rb'

describe GoldenDelicious::SerialNumber do
	it 'should remove the superfluous S appended by some scanners' do
		sn = GoldenDelicious::SerialNumber.new 'SW88401231AX'
		sn.to_s.should eq 'W88401231AX'
	end
	it 'should know the model number' do
		sn = GoldenDelicious::SerialNumber.new 'W88401231AX'
		sn.model.should eq '1AX'
	end
	it 'should be coerced into a string' do
		sn = GoldenDelicious::SerialNumber.new 'W88401231AX'
		sn.to_s.should eq 'W88401231AX'
	end
end