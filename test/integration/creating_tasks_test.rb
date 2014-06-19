require 'test_helper'

class CreatingTasksTest < ActionDispatch::IntegrationTest
  test 'can create a new task' do
    post tasks_path, name: "New Task"
    assert_redirected_to(tasks_path)

    tasks = Task.all
    assert_equal(1, tasks.size)
    task = tasks.first
    assert_equal("New Task", task.name)
    assert_not(task.completed_flag)
  end
end
