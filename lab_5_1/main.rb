# frozen_string_literal: true

def y(x, z, r)
  return '0 / 0' if
    x.zero? && r.zero? ||
    Math.cos(x + 3.1 * z).zero? && Math.tan(x / r).zero?

  return 'const / 0' if
    Math.tan(x / r).zero? ||
    r.zero?

  Math.cos(x + 3.1 * z).to_f / Math.tan(x / r)
end
