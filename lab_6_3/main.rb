# frozen_string_literal: true

def intprg(num, limits)
  delta_x = (limits[1] - limits[0]).to_f / num
  cur_x = 0
  func_sum = 0

  num.times do
    cur_x += delta_x
    func_sum += yield(cur_x)
  end

  func_sum * delta_x
end
