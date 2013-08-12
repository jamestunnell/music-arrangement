require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe FileRequirement do
  describe '#load' do
    it 'should load the file given during initialization' do
      req = FileRequirement.new('dummy')
      expect { Testing::Testing::Dummy }.to raise_error
      req.load
      expect { Testing::Testing::Dummy }.not_to raise_error
    end
  end
end
