require 'test_helper'

class LookupTaskTest < ActionDispatch::IntegrationTest
  test 'can get task by ID' do
    task = Task.create!(name: "ExTask")

    get "/tasks/#{task.id}"

    assert_equal 200, response.status
    assert_select "div#ExTask"
    assert_select "div#ExTask h2", "ExTask"
  end
end
