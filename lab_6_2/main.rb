# frozen_string_literal: true

def fact(num)
  num.downto(1).inject(&:*)
end

def calculate_elem(counter)
  pow = counter * 2 - 1

  (-1)**(counter - 1) * 3**pow / fact(pow).to_f
end

def calculate_sin(eps)
  taylor_series = Enumerator.new do |elem|
    counter = 0

    loop do
      counter += 1

      elem << calculate_elem(counter)
    end
  end

  taylor_series.inject([0, 1]) do |memo, elem|
    return memo unless elem.abs > eps

    [memo[0] + elem, memo[1] + 1]
  end
end
