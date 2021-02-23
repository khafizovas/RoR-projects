# frozen_string_literal: true

class LogicController < ApplicationController
  def calc_watering; end

  def ajax
    start_date = params[:month].to_i, params[:year].to_i

    begin
      validation(*start_date)
      @result = watering_days_year(*start_date)
    rescue
      @error = 'Error'
    end

    respond_to do |format|
      format.js { render 'calc_watering.js.erb' }
      format.json
    end
  end

  private

  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

  def validation(month, year)
    raise ArgumentError unless [month, year].all?(&:positive?)
    raise ArgumentError unless month.between?(1, 12)
  end

  def days_in_month(month, year)
    return 29 if month == 2 && Date.gregorian_leap?(year)

    COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  def frequency(month)
    return params[:winter].to_i if month.between?(1, 2) || month == 12
    return params[:spring].to_i if month.between?(3, 5)
    return params[:summer].to_i if month.between?(6, 8)
    return params[:autumn].to_i if month.between?(9, 11)
  end

  def watering_days_month(month, year)
    days_count = days_in_month(month, year)
    period = (days_count.to_f / frequency(month)).ceil - 1
    period += 1 if period.zero?
    counter = 1 - period

    frequency(month).times.map do
      counter = (counter > days_count) ? nil : counter + period
    end.compact
  end

  def watering_days_year(start_month, start_year)
    month = start_month
    year = start_year
    first = true

    12.times.map do
      unless first
        cur = (month + 1) % 12
        month = cur.zero? ? 12 : cur
        year += 1 if month == 1
      end

      first = false
      [ month, days_in_month(month, year), watering_days_month(month, year) ]
    end
  end
end
