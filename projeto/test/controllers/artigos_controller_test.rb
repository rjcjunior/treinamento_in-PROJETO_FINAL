require 'test_helper'

class ArtigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artigo = artigos(:one)
  end

  test "should get index" do
    get artigos_url
    assert_response :success
  end

  test "should get new" do
    get new_artigo_url
    assert_response :success
  end

  test "should create artigo" do
    assert_difference('Artigo.count') do
      post artigos_url, params: { artigo: { conteudo: @artigo.conteudo, data: @artigo.data, titulo: @artigo.titulo, user_id: @artigo.user_id } }
    end

    assert_redirected_to artigo_url(Artigo.last)
  end

  test "should show artigo" do
    get artigo_url(@artigo)
    assert_response :success
  end

  test "should get edit" do
    get edit_artigo_url(@artigo)
    assert_response :success
  end

  test "should update artigo" do
    patch artigo_url(@artigo), params: { artigo: { conteudo: @artigo.conteudo, data: @artigo.data, titulo: @artigo.titulo, user_id: @artigo.user_id } }
    assert_redirected_to artigo_url(@artigo)
  end

  test "should destroy artigo" do
    assert_difference('Artigo.count', -1) do
      delete artigo_url(@artigo)
    end

    assert_redirected_to artigos_url
  end
end
