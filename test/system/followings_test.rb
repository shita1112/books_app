require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:tarou)
  end

  test "Userをフォロー/フォロー解除すること" do
    visit users_url

    click_on "フォロー", match: :first
    assert_text "フォローしました。"

    click_on "フォロー解除", match: :first
    assert_text "フォロー解除しました。"
  end
end
