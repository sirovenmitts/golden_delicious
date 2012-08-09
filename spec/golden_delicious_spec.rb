require 'spec_helper'
require 'golden_delicious'

describe GoldenDelicious::GoldenDelicious do
	before :all do
		@gd = GoldenDelicious::GoldenDelicious.new 'W8734T8GZ5W'
	end
	it 'should turn into a serial number when inspected' do
		@gd.to_s.should eq 'W8734T8GZ5W'
	end
	it 'should delegate serial number validity testing to AppleInfo' do
		@gd.valid?.should eq true
	end
	# In the interest of not repeating tests I am only going to test
	# 1 value from the Stats object; if you want to know if the Stats
	# object works, visit stats_spec.rb.
	# NOTE: This could be a bad idea, since this is technically not
	# testing the Stats object, but rather delegation.
	it 'should delegate to Stats' do
		@gd.identifiers.model.should eq 'A1181'
	end
	it 'should remove the superfluous "S" prepended by some serial number scanners' do
		sn = GoldenDelicious::GoldenDelicious.new 'SW88401231AX'
		sn.to_s.should eq 'W88401231AX'
	end
end