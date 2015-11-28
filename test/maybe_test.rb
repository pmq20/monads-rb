require 'maybe'
require 'ostruct'
require 'minitest/autorun'

class MaybeTest < Minitest::Test
  def test_nil_soup
    @soup = nil
    assert_nil_chain
  end

  def test_nil_head
    @soup = OpenStruct.new(head: nil)
    assert_nil_chain
  end

  def test_nil_title
    @soup = OpenStruct.new(head: OpenStruct.new(title: nil))
    assert_nil_chain
  end

  def test_non_nil
    title = OpenStruct.new(string: 'Minqi Pan')
    @soup = OpenStruct.new(head: OpenStruct.new(title: title))
    assert_equal 'Minqi Pan', @soup.maybe.head.title.string.just
  end

  def test_bracket_support
    assert_equal 'M', 'Minqi Pan'.maybe[0].just
    assert_equal ' ', 'Minqi Pan'.maybe[0..6][-2].just
    assert_equal 'P', 'Minqi Pan'.maybe[6][0][0].just
  end

  def test_nil_bracket_support
    assert_equal nil, 'Minqi Pan'.maybe[0..6][-200].just
    assert_equal nil, 'Minqi Pan'.maybe[600][0][0].just
  end

  def test_no_method_error_support
    assert_raises(NoMethodError) do
      'Minqi Pan'.maybe.non_existing_method_on_non_nil_object
    end
  end

  def test_double_sample
    assert_equal 'Minqi Pan'.maybe.maybe.just, 'Minqi Pan'.maybe.just
  end

  private

  def assert_nil_chain
    assert_raises(NoMethodError) { @soup.head.title.string }
    assert_equal nil, @soup.maybe.head.title.string.just
  end
end
