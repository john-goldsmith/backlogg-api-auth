require 'test_helper'

class AuthTest < ActiveSupport::TestCase
  def setup
    @auth = Auth.new
  end

  test 'valid auth' do
    assert @auth.valid?
    assert_empty @auth.errors
  end
end