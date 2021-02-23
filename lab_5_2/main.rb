# frozen_string_literal: true

def correct(words)
  words.split.map do |word|
    if word =~ /(.*)ing$/
      word.sub(/ing$/, 'ed')
    else
      word
    end
  end.join(' ')
end

def print_strings(strings)
  strings.each { |string| puts string }
end
