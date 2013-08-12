module Music
module Arrangement

class ClassSpecifier
  include Hashmake::HashMakeable

  # hashed-arg specs (for hash-makeable idiom)
  ARG_SPECS = {
    :requirements => arg_spec_array(:reqd => false, :type => [GemRequirement, FileRequirement]),
    :qualified_name => arg_spec(:reqd => true, :type => String),
  }

  def initialize args={}
    hash_make args, ClassSpecifier::ARG_SPECS
  end

  def load_requirements
    @requirements.each do |req|
      req.load
    end
  end

  def to_class
    load_requirements
    tokens = @qualified_name.split(/::/)
    
    module_names = tokens[0...-1]
    class_name = tokens.last

    cur_module = Kernel
    module_names.each do |module_name|
      cur_module = cur_module.const_get(module_name)
    end

    return cur_module.const_get(class_name)
  end
end

end
end
