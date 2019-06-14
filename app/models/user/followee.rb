class User
  concern :Followee do
    included do
      has_many :followeds,
               class_name: "Following",
               foreign_key: "followee_id",
               dependent: :destroy
      has_many :followers,
               through: :followeds
    end
  end
end
