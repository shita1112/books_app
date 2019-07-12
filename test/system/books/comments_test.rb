require "application_system_test_case"

class Books::CommentsTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_1)
  end

  test "Comment一覧を表示すること" do
    visit book_comments_url(@book)
    assert_selector "h1", text: "コメント"
  end

  test "Commentを作成すること" do
    visit new_book_comment_url(@book)
    fill_in "内容", with: "いいですね。"
    click_on "登録する"
    assert_text "コメントが作成されました。"
  end

  test "Commentを更新すること" do
    visit edit_book_comment_url(@book, comments(:comment_of_book_1))
    fill_in "内容", with: "よくないですね。"
    click_on "更新する"
    assert_text "コメントが更新されました。"
  end

  test "Commentを削除すること" do
    visit book_comments_url(@book)
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "コメントが削除されました。"
  end
end
