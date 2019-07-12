require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  test "Report一覧を表示すること" do
    visit reports_url
    assert_selector "h1", text: "日報"
  end

  test "Reportを作成すること" do
    visit new_report_url
    fill_in "タイトル", with: "初日報"
    fill_in "内容", with: "がんばります！"
    click_on "登録する"
    assert_text "日報が作成されました。"
  end

  test "Reportを更新すること" do
    visit edit_report_url(reports(:report_1))
    fill_in "タイトル", with: "初日報"
    fill_in "内容", with: "がんばります！"
    click_on "更新する"
    assert_text "日報が更新されました。"
  end

  test "Reportを削除すること" do
    visit reports_url
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "日報が削除されました。"
  end
end
