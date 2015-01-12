require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: projects(:one)
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show tasks for a given project" do
    get :show, id: projects(:one)
    assert_template :show
    assert_not_empty assigns(:project).tasks
    assert_select ".tasks_table tr.table-list"
  end

  test "should show a specific task for a given project" do
    get :show, id: projects(:one)
    assert_template :show
    assert_not_empty assigns(:project).tasks
    assert_select ".tasks_table td.task-title", tasks(:one).title
  end

end
