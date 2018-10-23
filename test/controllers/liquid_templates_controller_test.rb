require 'test_helper'

class LiquidTemplatesControllerTest < ActionController::TestCase
  setup do
    @liquid_template = liquid_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquid_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquid_template" do
    assert_difference('LiquidTemplate.count') do
      post :create, liquid_template: { body: @liquid_template.body, label: @liquid_template.label }
    end

    assert_redirected_to liquid_template_path(assigns(:liquid_template))
  end

  test "should show liquid_template" do
    get :show, id: @liquid_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquid_template
    assert_response :success
  end

  test "should update liquid_template" do
    patch :update, id: @liquid_template, liquid_template: { body: @liquid_template.body, label: @liquid_template.label }
    assert_redirected_to liquid_template_path(assigns(:liquid_template))
  end

  test "should destroy liquid_template" do
    assert_difference('LiquidTemplate.count', -1) do
      delete :destroy, id: @liquid_template
    end

    assert_redirected_to liquid_templates_path
  end
end
