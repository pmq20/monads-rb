require 'test_helper'
require 'monad_test'

class MaybeTest < Minitest::Test
  def setup
    @string = 'an_actual_string'
    @title = Minitest::Mock.new.expect(:string, @string)
    @head = Minitest::Mock.new.expect(:title, @title)
    @soup = Minitest::Mock.new.expect(:head, @head)
  end

  def test_non_nil
    assert_equal 'an_actual_string', soup.maybe.head.title.string.just
  end

  def test_nil_soup
    @soup = nil
    nil_check
  end

  def test_nil_head
    @soup.expect(:head, nil)
    nil_check
  end

  def test_nil_title
    @head.expect(:title, nil)
    nil_check
  end

  private
  def nil_check
    assert_raises NoMethodError do
      @soup.head.title.string
    end
    assert_equal nil, @soup.maybe.head.title.string.just
  end
end
