require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  def setup
    @athlete = athletes(:one)
  end

  test "GET index" do
    get :index, format: :json
    response_item = JSON.parse(response.body)[0]
    ['id', 'sport', 'name', 'height', 'personal_record'].each do |attr|
      assert_equal @athlete.send(attr), response_item[attr]
    end
    assert_equal @athlete.retired_at.to_s, response_item['retired_at']
    assert_response :success
  end

  test "POST create an athlete" do
    assert_difference('Athlete.count', 1) do
    post :create, format: :json, athlete: { sport: 'test sport', name: 'test name', weight: '180', height: 'test height', personal_record: 'test record' }
    end
  assert_response :success
  end

  test "GET show an athlete" do
    get :show, id: @athlete, format: :json
    response_item = JSON.parse(response.body)
    ['id', 'sport', 'name', 'height', 'personal_record'].each do |attr|
      assert_equal @athlete.send(attr), response_item[attr]
    end
    assert_equal @athlete.retired_at.to_s, response_item['retired_at']
    assert_response :success
  end

  test "PATCH update an athlete" do
    patch :update, format: :json, id: @athlete, athlete: { sport: 'test sport1', name: 'test name1', weight: '180b', height: 'test height1', personal_record: 'test record1' }
    assert_response :success
  end

  test "DELETE an athlete" do
    assert_difference('Athlete.count', -1) do
    delete :destroy, format: :json, id: @athlete
    end
  end

end
