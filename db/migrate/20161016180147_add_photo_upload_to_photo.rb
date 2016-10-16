class AddPhotoUploadToPhoto < ActiveRecord::Migration[5.0]
  def up
      add_attachment :photos, :avatar
    end

  def down
      remove_attachment :photos, :avatar
   end
end
