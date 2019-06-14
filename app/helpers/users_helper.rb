module UsersHelper
  def follow_button_or_unfollow_link(user)
    return if user == current_user

    following = Following.find_by(follower: current_user, followee: user)
    if following
      link_to t("users.index.unfollow"), following, method: :delete
    else
      button_to t("users.index.follow"), [:followings, followee_id: user.id]
    end
  end
end
