# test/models/detail_test.rb
require "test_helper"

class DetailTest < ActiveSupport::TestCase
  test "should not save detail without email" do
    detail = Detail.new
    assert_not detail.save, "Saved the detail without an email"
  end
end
