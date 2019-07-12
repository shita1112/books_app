require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    sign_in users(:tarou)
  end

  test "User一覧を表示すること" do
    visit users_url
    assert_selector "h1", text: "ユーザー"
  end

  test "Userを更新すること" do
    visit edit_user_url(users(:tarou))
    fill_in "郵便番号", with: "163-9001"
    fill_in "住所", with: "東京都新宿区西新宿５丁目９−１"
    fill_in "自己紹介", with: "次郎です。よろしくおねがいします。"
    click_on "更新する"
    assert_text "ユーザーが更新されました。"
  end
end
