require "application_system_test_case"

class Reports::CommentsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_1)
  end

  test "Comment一覧を表示すること" do
    visit report_comments_url(@report)
    assert_selector "h1", text: "コメント"
  end

  test "Commentを作成すること" do
    visit new_report_comment_url(@report)
    fill_in "内容", with: "いいですね。"
    click_on "登録する"
    assert_text "コメントが作成されました。"
  end

  test "Commentを更新すること" do
    visit edit_report_comment_url(@report, comments(:comment_of_report_1))
    fill_in "内容", with: "よくないですね。"
    click_on "更新する"
    assert_text "コメントが更新されました。"
  end

  test "Commentを削除すること" do
    visit report_comments_url(@report)
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "コメントが削除されました。"
  end
end
