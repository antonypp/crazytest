require File.expand_path('test/test_helper')

class AllTest < Crazytest::TestCase

  def test_assert_ok
    assert true
  end

  def test_assert_fail
    assert_exception lambda{assert false}, Crazytest::FailError
  end

  def test_assert_error
    assert_exception lambda{raise(Crazytest::FailError)}, Crazytest::FailError
  end

end
