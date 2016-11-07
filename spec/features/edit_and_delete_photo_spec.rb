require 'rails_helper'

feature 'photos' do

  context 'deleting photos' do

    let!(:photo){Photo.create(name: "Test", description: "Test_Description")}

    scenario 'a visitor can visit a specific photo' do
      visit_photo(photo)
      expect(current_path).to eq "/photos/#{photo.id}"
    end

    scenario 'a visitor can edit a photo' do
      visit_photo(photo)
      click_link("Edit #{photo.name}")
      fill_in 'Name', with: "Turfy!"
      fill_in 'Description', with: "Awesome app"
      click_button("Update Photo")
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content("Turfy!")

    end

  end


end
