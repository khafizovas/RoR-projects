# frozen_string_literal: true

class CalcController < ApplicationController
  def result
    n = params[:n].to_i

    result = Result.find_or_initialize_by(n: n)

    if result.new_record?
      result.values = find_palindromes n

      result.save!
    end

    @result = result.values

    respond_to do |format|
      format.json { render json: @result }
      format.html { render }
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def index; end

  def cached
    result = Result.all.map { |inst| { n: inst.n, result: inst.values } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
      format.json { render json: result }
    end
  end

  private

  def is_palindrome?(str_num)
    str_num == str_num.reverse
  end

  def find_palindromes(n)
    0.upto(n - 1).map do |num|
      num_dec = num.to_s(10)
      num_bin = num.to_s(2)

      (is_palindrome?(num_dec) && is_palindrome?(num_bin)) ? { dec: num_dec.to_i, bin: num_bin.to_i } : nil
    end.compact
  end
end
