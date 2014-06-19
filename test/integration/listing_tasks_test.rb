require 'test_helper'

class ListingTasksTest < ActionDispatch::IntegrationTest
  test 'tasks#index returns a valid response' do
    get '/tasks'

    assert_equal 200, response.status
    refute_empty response.body
  end

  test '/tasks returns a list of all tasks' do
    milk = Task.create!(name: "Remember the Milk")
    wash = Task.create!(name: "Wash the Car")

    get '/tasks'

    assert_equal 200, response.status
    assert_select 'ul' do
      assert_select 'li' do |elements|
        assert_equal 3, elements.size
      end
    end
  end
end
