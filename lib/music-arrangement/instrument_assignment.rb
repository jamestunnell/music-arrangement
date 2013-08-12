module Music
module Arrangement

# Contains all the information needed to create the instrument plugin, configure
# initial settings, and any settings changes.
#
# @author James Tunnell
class InstrumentAssignment
  include Hashmake::HashMakeable

  # hashed-arg specs (for hash-makeable idiom)
  ARG_SPECS = {
    :class_specifier => arg_spec(:reqd => true, :type => ClassSpecifier),
    :initial_settings => arg_spec_array(:reqd => false, :type => [Preset, Setting])
  }
  
  # A new instance of InstrumentConfig.
  def initialize args={}
    hash_make args, InstrumentAssignment::ARG_SPECS
  end
end

end
end
