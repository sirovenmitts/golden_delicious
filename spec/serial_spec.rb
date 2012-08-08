require 'spec_helper'
require 'golden_delicious/serial'

describe GoldenDelicious::Serial do
	before :each do
		@old = GoldenDelicious::Serial.new 'W88401231AX'
		@new = GoldenDelicious::Serial.new 'C02CG123DC79'
	end
	it 'should have a manufacturing location' do
		@old.manufactured_at.should eq 'W8'
		@new.manufactured_at.should eq 'C02'
	end
	it 'should have a year the device was manufactured' do
		@old.manufacture_year.should eq '8'
		@new.manufacture_year.should eq 'C'
	end
	it 'should have a week the device was manufactured' do
		@old.manufacture_week.should eq '40'
		@new.manufacture_week.should eq 'G'
	end
	it 'should have a unique identifier' do
		@old.unique_identifier.should eq '123'
		@new.unique_identifier.should eq '123'
	end
	it 'should have a model number' do
		@old.model.should eq '1AX'
		@new.model.should eq 'DC79'
	end
	it 'should check the validity of a supplied serial number' do
		@valid = GoldenDelicious::Serial.new 'W88401231AX'
		@valid.valid?.should eq true
		@invalid = GoldenDelicious::Serial.new '12345678901'
		@invalid.valid?.should eq false
	end
end