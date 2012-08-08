require 'spec_helper'
require 'golden_delicious/stats'

describe Stats do
	before :all do
		# This is the model number for a Mid 2007 Macbook. All these
		# stats can be verified at [1]
		@stats = Stats.new 'Z5W'
	end
	it 'should provide information about device memory' do
		@stats.memory.slots.should eq 2
		@stats.memory.max.should eq 4
		@stats.memory.type.should eq 'PC2-5300 DDR2'
		@stats.memory.speed.should eq '667 MHz'
	end
	it 'should provide information about device storage' do
		@stats.storage.interface.should eq 'Serial ATA  (1.5 Gb/s)'
	end
	it 'should provide information about device identifiers' do
		@stats.identifiers.order.should eq 'MB062LL/A'

		@stats.identifiers.family.should eq 'MacBook2,1'
		@stats.identifiers.sub_family.should eq 'Mid-2007'
		
		@stats.identifiers.emc.should eq '2139'
		
		@stats.identifiers.model.should eq 'A1181'
		@stats.identifiers.short_model.should eq 'Z5W'
	end
end
__END__
[1]: http://everymac.com/systems/apple/macbook/specs/macbook-core-2-duo-2.16-white-13-mid-2007-specs.html