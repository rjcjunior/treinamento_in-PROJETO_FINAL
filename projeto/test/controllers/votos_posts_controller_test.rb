require 'test_helper'

class VotosPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @votos_post = votos_posts(:one)
  end

  test "should get index" do
    get votos_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_votos_post_url
    assert_response :success
  end

  test "should create votos_post" do
    assert_difference('VotosPost.count') do
      post votos_posts_url, params: { votos_post: { post_id: @votos_post.post_id, user_id: @votos_post.user_id, votoPost: @votos_post.votoPost } }
    end

    assert_redirected_to votos_post_url(VotosPost.last)
  end

  test "should show votos_post" do
    get votos_post_url(@votos_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_votos_post_url(@votos_post)
    assert_response :success
  end

  test "should update votos_post" do
    patch votos_post_url(@votos_post), params: { votos_post: { post_id: @votos_post.post_id, user_id: @votos_post.user_id, votoPost: @votos_post.votoPost } }
    assert_redirected_to votos_post_url(@votos_post)
  end

  test "should destroy votos_post" do
    assert_difference('VotosPost.count', -1) do
      delete votos_post_url(@votos_post)
    end

    assert_redirected_to votos_posts_url
  end
end
