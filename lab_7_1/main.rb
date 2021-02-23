# frozen_string_literal: true

def generate_line
  type = rand(1..2)
  res_string = type.to_s

  num = type == 1 ? 4 : 3
  num.times { res_string += ", #{rand(100)}" }

  res_string
end

def generate_file(file_name, num_lines = 13)
  File.open(file_name, 'w') do |file|
    num_lines.times { file.puts generate_line }
  end
end
