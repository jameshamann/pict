require 'rails_helper'

feature 'photos' do

  context 'deleting photos' do

    let!(:photo){Photo.create(name: "Test", description: "Test_Description")}

    scenario 'a visitor can visit a specific photo' do
      visit_photo(photo)
      expect(current_path).to eq "/photos/#{photo.id}"
    end

    # scenario 'a visitor can delete a photo' do
    #   upload_photo
    #   click_link("Edit photo")
    #   fill_in 'Name', with: "Turfy!"
    #   fill_in 'Description', with: "Awesome app"
    #   click_link("Update Photo")
    #   attach_file "photo_avatar", './public/Turfy.png'
    #   expect(current_path).to eq "/photos"
    #   expect(page).to have_content("Turfy!")
    #
    # end

  end


end
