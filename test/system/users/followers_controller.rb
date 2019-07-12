require "application_system_test_case"

class Users::FollowersTest < ApplicationSystemTestCase
  setup do
    sign_in users(:tarou)
  end

  test "フォロワー一覧を表示すること" do
    visit users_url
    click_on "フォロワー一覧", match: :first
    assert_text "フォロワー一覧"
  end
end
