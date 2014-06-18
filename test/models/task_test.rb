require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'invalid without a name' do
    t = Task.new
    assert !t.valid?, "Name is not being validated!"
  end

  test 'name is unique' do
    assert  Task.create(name: "Unique").valid?
    assert !Task.create(name: "Unique").valid?,
      "Name uniqueness is not being validated!"
  end
end
