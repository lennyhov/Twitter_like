require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

    # called before every single test
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  # called after every single test
  def teardown
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "signup page title" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end
end
