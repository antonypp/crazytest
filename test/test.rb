require File.expand_path('test/test_helper')

class Test < Crazytest::TestCase

  def test_assert_ok
    assert true
  end

  def test_assert_fail
    assert false
  end

  def test_assert_error
    assert raise
  end

end
