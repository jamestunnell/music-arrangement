require 'rspec'
require 'music-arrangement'

include Music::Arrangement

UPPERCASE_LETTERS = [
  "A", "B", "C", "D", "E", "F", "G", "H", "I",
  "J", "K", "L", "M", "N", "O", "P", "Q", "R",
  "S", "T", "U", "V", "W", "X", "Y", "Z"
]

LOWERCASE_LETTERS = [
  "a", "b", "c", "d", "e", "f", "g", "h", "i",
  "j", "k", "l", "m", "n", "o", "p", "q", "r",
  "s", "t", "u", "v", "w", "x", "y", "z"
]

def rand_identifier len
  id = UPPERCASE_LETTERS[rand(UPPERCASE_LETTERS.count)]
  (len-1).times do
    id.concat LOWERCASE_LETTERS[rand(LOWERCASE_LETTERS.count)]
  end
  return id
end

def make_empty_class_file dir_name, class_name, *module_names
  file_name = "#{class_name.downcase}.rb"
  File.open("#{dir_name}/#{file_name}", "w") do |file|
    module_names.each do |module_name|
      file.write("module #{module_name}\n")
    end

    file.write("class #{class_name}\nend\n")
      
    module_names.each do |module_name|
      file.write("end\n")
    end
  end
  return file_name
end
