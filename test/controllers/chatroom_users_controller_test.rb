require 'test_helper'

class ChatroomUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroom_user = chatroom_users(:one)
  end

  test "should get index" do
    get chatroom_users_url, as: :json
    assert_response :success
  end

  test "should create chatroom_user" do
    assert_difference('ChatroomUser.count') do
      post chatroom_users_url, params: { chatroom_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show chatroom_user" do
    get chatroom_user_url(@chatroom_user), as: :json
    assert_response :success
  end

  test "should update chatroom_user" do
    patch chatroom_user_url(@chatroom_user), params: { chatroom_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy chatroom_user" do
    assert_difference('ChatroomUser.count', -1) do
      delete chatroom_user_url(@chatroom_user), as: :json
    end

    assert_response 204
  end
end
