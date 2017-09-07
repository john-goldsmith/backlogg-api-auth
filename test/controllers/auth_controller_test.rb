require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  fixtures :auth

  def setup
    @version = v1
    @auth = auth()
    @serializer = V1::AuthSerializer.new @auth
    @serialization = ActiveModelSerializers::Adapter.create @serializer
  end

  test 'index' do
    get v1_url
    assert_response :success
  end

  test 'create' do
    params = {
      auth: {
      }
    }
    assert_difference('Auth.count') do
      post v1_url, params: params
    end
    assert_response :success
    assert_equal @auth, Auth.last
  end

  test 'create invalid record' do
    params = {
      auth: {}
    }
    post v1_url, params: params
    assert_response :unprocessable_entity
    expected = '{"errors":[{"detail":"","status":422}]}'
    assert_equal expected, @response.body
  end

  test 'show' do
    get "/#{@version}/#{@auth.id}"
    assert_response :success
    assert_equal @serialization.to_json, @response.body
  end

  test 'show 404' do
    auth_id = 123456789
    get "/#{@version}/#{user_id}"
    assert_response :not_found
    expected = '{"errors":[{"id":"#{user_id}","detail":"Couldn\'t find Auth with \'id\'=#{user_id}","status":404,"meta":{"model":"Auth"}}]}'
    assert_equal expected, @response.body
  end

  test 'update' do
    params = {
      auth: {}
    }
    put "/#{@version}/#{@auth.id}", params: params
    assert_response :success
    assert_equal @auth.email, Auth.find(@auth.id)
  end

  test 'update param missing' do
    params = {
      auth: {}
    }
    put "/#{@version}/#{@auth.id}", params: params
    assert_response :bad_request
    expected = '{"errors":[{"detail":"param is missing or the value is empty: auth","status":400,"meta":{"param":"auth"}}]}'
    assert_equal expected, @response.body
  end

  test 'destroy' do
    assert_difference('Auth.count', -1) do
      delete "/#{@version}/#{@auth.id}"
    end
    assert_response :success
    refute_equal Auth.last, @auth
  end

  test 'docs' do
    # get v1_docs_url
    # assert_response :success
  end
end
