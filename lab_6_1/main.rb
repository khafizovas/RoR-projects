# frozen_string_literal: true

def fact(num)
  num.downto(1).inject(&:*)
end

def calculate_sin(eps)
  prev = cur = 0
  counter = 0

  while (prev - cur).abs > eps || counter.zero?
    counter += 1
    pow = counter * 2 - 1

    prev = cur
    cur += (-1)**(counter - 1) * 3**pow / fact(pow).to_f
  end

  [cur, counter]
end
