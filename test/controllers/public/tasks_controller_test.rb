require "test_helper"

class Public::TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_tasks_index_url
    assert_response :success
  end

  test "should get new" do
    get public_tasks_new_url
    assert_response :success
  end

  test "should get create" do
    get public_tasks_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_tasks_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_tasks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_tasks_destroy_url
    assert_response :success
  end
end
