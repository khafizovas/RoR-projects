# frozen_string_literal: true

require 'minitest/autorun'
require './main'

class TestWorkWithFiles < Minitest::Test
  def setup
    @generated_file_name = 'test_generated.txt'
  end

  def test_generate_file_creates_not_empry_file
    num_sentences = 4
    generate_file(generated_file_name, num_sentences)

    assert File.exist?(generated_file_name)

    File.open(generated_file_name) do |file|
      file_content = file.read
      assert file_content.size
      assert_equal num_sentences, file_content.split("\n").size
    end
  end

  def teardown
    File.delete(generated_file_name) if File.exist?(generated_file_name)
  end

  private

  attr_reader :generated_file_name
end
