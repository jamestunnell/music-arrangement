require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ClassSpecifier do
  describe '#load_requirements' do
    it 'should load any FileRequirement given in requirements' do
      expect { Testing::Testing::Dummy2 }.to raise_error
      ClassSpecifier.new(
        :requirements => [FileRequirement.new('dummy2')],
        :qualified_name => "Testing::Testing::Dummy2"
      ).load_requirements
      expect { Testing::Testing::Dummy2 }.not_to raise_error
    end

    it 'should load any GemRequirement given in requirements' do
      expect { YARD::Logger }.to raise_error
      ClassSpecifier.new(
        :requirements => [GemRequirement.new('yard')],
        :qualified_name => "YARD::Logger"
      ).load_requirements
      expect { YARD::Logger }.not_to raise_error
    end
  end

  describe '#to_class' do
    context 'file requirement given' do
      it 'should search through module namespaces to find class' do
        expect { Testing::Testing::Dummy3 }.to raise_error
        ClassSpecifier.new(
          :requirements => [FileRequirement.new('dummy3')],
          :qualified_name => "Testing::Testing::Dummy3"
        ).to_class.should eq(Testing::Testing::Dummy3)
      end
    end

    context 'gem requirement given' do
      it 'should search through module namespaces to find class' do
        expect { Ore::Template::Directory }.to raise_error
        ClassSpecifier.new(
          :requirements => [FileRequirement.new('ore')],
          :qualified_name => "Ore::Template::Directory"
        ).to_class.should eq(Ore::Template::Directory)
      end
    end
  end

end
