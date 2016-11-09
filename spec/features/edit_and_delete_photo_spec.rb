require 'rails_helper'

feature 'photos' do
  context 'editing and deleting photos' do
    let!(:photo) {Photo.create(name: 'Test', description: 'Test_Description') }

    before do
      sign_up
    end

    it 'a visitor can visit a specific photo' do
      visit_photo(photo)
      expect(current_path).to eq "/photos/#{photo.id}"
    end

    it 'a visitor can edit a photo' do
      visit_photo(photo)
      click_link("Edit #{photo.name}")
      fill_in 'Name', with: 'Turfy!'
      fill_in 'Description', with: 'Awesome app'
      click_button("Update Photo")
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content('Turfy!')
    end

    it 'a visitor can delete a photo' do
      visit_photo(photo)
      click_link("Edit #{photo.name}")
      click_link("Delete #{photo.name}")
      expect(current_path).to eq '/photos'
      expect(page).to_not have_content('Test')
    end
  end
end
