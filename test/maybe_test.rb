require 'maybe'
require 'minitest/autorun'

class MaybeTest < Minitest::Test
  def test_nil_soup
    @soup = nil
    assert_nil_chain
  end

  def test_nil_head
    @soup = Minitest::Mock.new.expect(:head, nil)
    assert_nil_chain
  end

  def test_nil_title
    @head = Minitest::Mock.new.expect(:title, nil)
    @soup = Minitest::Mock.new.expect(:head, @head)
    assert_nil_chain
  end

  def test_non_nil
    @string = 'Minqi Pan'
    @title = Minitest::Mock.new.expect(:string, @string)
    @head = Minitest::Mock.new.expect(:title, @title)
    @soup = Minitest::Mock.new.expect(:head, @head)
    assert_equal 'Minqi Pan', soup.maybe.head.title.string.just
  end

  private

  def assert_nil_chain
    assert_raises NoMethodError { @soup.head.title.string }
    assert_equal nil, @soup.maybe.head.title.string.just
  end
end
