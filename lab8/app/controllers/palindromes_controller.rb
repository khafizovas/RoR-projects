class PalindromesController < ApplicationController
  def input; end

  def view
    begin
      n_val = Integer params[:n]
      
      raise ArgumentError unless n_val.between?(1, 10e6)
      @result = find_palindromes n_val
    rescue
      @error = 'Некорректный ввод!'
    end

    respond_to do |format|
      format.json { render json: @result }
      format.html { render }
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
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

      (is_palindrome?(num_dec) && is_palindrome?(num_bin)) ? { dec: num_dec, bin: num_bin } : nil
    end.compact
  end

end
