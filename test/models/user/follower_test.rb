require "test_helper"

class User::FollowerTest < ActiveSupport::TestCase
  setup do
    @follower = users(:tarou)
  end

  test "#followで、userを未フォローの場合、フォローすること" do
    user = users(:hanako)

    assert_difference("@follower.followees.count", 1) { @follower.follow(user) }
    assert @follower.following?(user)
  end

  test "#followで、userをフォロー済みの場合、フォローしないこと" do
    user = users(:hanako)
    @follower.follow(user)

    assert_difference("@follower.followees.count", 0) { @follower.follow(user) }
  end

  test "#followで、userが自分の場合、フォローしないこと" do
    user = users(:tarou)

    assert_difference("@follower.followees.count", 0) { @follower.follow(user) }
    assert_not @follower.following?(user)
  end

  test "#following?で、userを未フォローの場合、falseを返すこと" do
    user = users(:hanako)

    assert_not @follower.following?(user)
  end

  test "#following?で、userをフォロー済みの場合、trueを返すこと" do
    user = users(:hanako)
    @follower.follow(user)

    assert @follower.following?(user)
  end
end
