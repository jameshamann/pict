class RemovingUserRefFromComments < ActiveRecord::Migration[5.0]
  def change
    # remove_reference(:comments, :user, index: true, foreign_key: true)
  end
end
