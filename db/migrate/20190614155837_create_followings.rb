class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :follower_id, index: true, null: false
      t.integer :followee_id, index: true, null: false

      t.timestamps
    end

    add_index :followings, %i[follower_id followee_id], unique: true
  end
end
