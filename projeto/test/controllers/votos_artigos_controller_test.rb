require 'test_helper'

class VotosArtigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @votos_artigo = votos_artigos(:one)
  end

  test "should get index" do
    get votos_artigos_url
    assert_response :success
  end

  test "should get new" do
    get new_votos_artigo_url
    assert_response :success
  end

  test "should create votos_artigo" do
    assert_difference('VotosArtigo.count') do
      post votos_artigos_url, params: { votos_artigo: { artigo_id: @votos_artigo.artigo_id, user_id: @votos_artigo.user_id, votoArtigo: @votos_artigo.votoArtigo } }
    end

    assert_redirected_to votos_artigo_url(VotosArtigo.last)
  end

  test "should show votos_artigo" do
    get votos_artigo_url(@votos_artigo)
    assert_response :success
  end

  test "should get edit" do
    get edit_votos_artigo_url(@votos_artigo)
    assert_response :success
  end

  test "should update votos_artigo" do
    patch votos_artigo_url(@votos_artigo), params: { votos_artigo: { artigo_id: @votos_artigo.artigo_id, user_id: @votos_artigo.user_id, votoArtigo: @votos_artigo.votoArtigo } }
    assert_redirected_to votos_artigo_url(@votos_artigo)
  end

  test "should destroy votos_artigo" do
    assert_difference('VotosArtigo.count', -1) do
      delete votos_artigo_url(@votos_artigo)
    end

    assert_redirected_to votos_artigos_url
  end
end
