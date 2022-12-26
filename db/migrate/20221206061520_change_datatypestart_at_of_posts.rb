class ChangeDatatypestartAtOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :start_at, :datetime
  end
end
