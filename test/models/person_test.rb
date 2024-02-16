# test/models/person_test.rb
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "should not save person without name" do
    person = Person.new
    assert_not person.save, "Saved the person without a name"
  end

  test "should destroy associated details when person is destroyed" do
    person = Person.create(name: "John Doe")
    person.details.create(title: "Title", age: 30, phone: "123456789", email: "john@example.com")

    assert_difference('Detail.count', -1) do
      person.destroy
    end
  end
end
