module Music
module Arrangement

class GemRequirement
  def initialize gem_name, gem_version = ""
    @gem_name = gem_name
    @gem_version = gem_version
  end

  def load
    if @gem_version.empty?
      gem @gem_name
    else
      gem @gem_name, @gem_version
    end
    require @gem_name
  end
end

end
end
