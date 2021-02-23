# frozen_string_literal: true

require './main'

puts 'Введите координаты двух точек, проходящих через прямую, её толщину и координаты третьей точки через пробел'

params = gets.chomp.split.map { |x| Float x, exception: false }.compact

unless params.size == 7
  puts 'Некорректный ввод'
  exit 1
end

x1, y1, x2, y2, thickness, x, y = params

if x1 == x2 && y1 == y2
  puts 'Введите координаты двух различных точек!'
  exit 1
end

line = Line.new x1, y1, x2, y2
thick_line = ThickLine.new x1, y1, x2, y2, thickness

puts 'Параметры прямой:'
puts "Координаты двух точек: (#{line.x1}, #{line.y1}), (#{line.x2}, #{line.y2})"
puts "Проходит ли через точку (#{x}, #{y}): #{line.include_point? x, y}"

puts 'Параметры прямой с толщиной:'
puts "Координаты двух точек: (#{thick_line.x1}, #{thick_line.y1}), (#{thick_line.x2}, #{thick_line.y2})"
puts "Проходит ли через точку (#{x}, #{y}): #{thick_line.include_point? x, y}"
