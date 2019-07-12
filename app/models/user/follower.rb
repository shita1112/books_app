class User
  concern :Follower do
    included do
      has_many :followings,
               foreign_key: "follower_id",
               dependent: :destroy
      has_many :followees,
               through: :followings
    end

    def follow(user)
      return if following?(user)
      return if self == user

      followings.create(followee: user)
    end

    def following?(user)
      followings.exists?(followee: user)
    end
  end
end
