require 'test_helper'

class UserArtigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_artigo = user_artigos(:one)
  end

  test "should get index" do
    get user_artigos_url
    assert_response :success
  end

  test "should get new" do
    get new_user_artigo_url
    assert_response :success
  end

  test "should create user_artigo" do
    assert_difference('UserArtigo.count') do
      post user_artigos_url, params: { user_artigo: { artigo_id: @user_artigo.artigo_id, user_id: @user_artigo.user_id } }
    end

    assert_redirected_to user_artigo_url(UserArtigo.last)
  end

  test "should show user_artigo" do
    get user_artigo_url(@user_artigo)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_artigo_url(@user_artigo)
    assert_response :success
  end

  test "should update user_artigo" do
    patch user_artigo_url(@user_artigo), params: { user_artigo: { artigo_id: @user_artigo.artigo_id, user_id: @user_artigo.user_id } }
    assert_redirected_to user_artigo_url(@user_artigo)
  end

  test "should destroy user_artigo" do
    assert_difference('UserArtigo.count', -1) do
      delete user_artigo_url(@user_artigo)
    end

    assert_redirected_to user_artigos_url
  end
end
