require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe GemRequirement do
  describe '#load' do
    it 'should load the file given during initialization' do
      req = GemRequirement.new('rake')
      expect { Rake::FileTask }.to raise_error
      req.load
      expect { Rake::FileTask }.not_to raise_error
    end
  end
end
