module Music
module Arrangement

class GemRequirement
  def initialize gem_name, gem_version
    @gem_name = gem_name
    @gem_version = gem_version
  end

  def load
    if gem(@gem_name, @gem_version)
      require @gem_name
    else
      return false
    end
  end
end

end
end
