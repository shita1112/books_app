require "application_system_test_case"

class Users::FolloweesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:tarou)
  end

  test "フォロイー一覧を表示すること" do
    visit users_url
    click_on "フォロイー一覧", match: :first
    assert_text "フォロイー一覧"
  end
end
