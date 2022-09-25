# frozen_string_literal: true

require "test_helper"

class Public::AchievementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_achievements_index_url
    assert_response :success
  end

  test "should get create" do
    get public_achievements_create_url
    assert_response :success
  end

  test "should get new" do
    get public_achievements_new_url
    assert_response :success
  end
end
