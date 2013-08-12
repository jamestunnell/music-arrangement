module Music
module Arrangement

class FileRequirement
  def initialize file_path, relative = false
    @file_path = file_path
    @relative = relative
  end

  def load
    if @relative
      require_relative @file_path
    else
      require @file_path
    end
  end
end

end
end
