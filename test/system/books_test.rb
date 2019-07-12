require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  test "Book一覧を表示すること" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "Bookを作成すること" do
    visit new_book_url
    fill_in "タイトル", with: "Vue.js入門"
    click_on "登録する"
    assert_text "本が作成されました。"
  end

  test "Bookを更新すること" do
    visit edit_book_url(books(:book_1))
    fill_in "タイトル", with: "パーフェクトRails2"
    click_on "更新する"
    assert_text "本が更新されました。"
  end

  test "Bookを削除すること" do
    visit books_url
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "本が削除されました。"
  end
end
