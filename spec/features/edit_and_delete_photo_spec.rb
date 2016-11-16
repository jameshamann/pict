require 'rails_helper'

feature 'photos' do

  let!(:user) {User.create(email: "test@example.com", password: "1234567")}
  let!(:user_two) {User.create(email: "test_two@example.com", password: "12345678")}
  let!(:photo) {Photo.create(name: 'Test', description: 'Test_Description', user_id: user.id) }

  context 'user who uploaded photo is signed in' do
    before do
      sign_in(email: user.email, password: user.password)
    end

    it 'a visitor can visit a specific photo' do
      upload_photo
      click_link "#{photo.name}"
      expect(current_path).to eq "/photos/#{photo.id}"
    end

    it 'a user can edit a photo they created' do
      visit_photo(photo)
      click_link("Edit #{photo.name}")
      fill_in 'Name', with: 'Turfy!'
      fill_in 'Description', with: 'Awesome app'
      click_button("Update Photo")
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content('Turfy!')
    end

    it 'a user can delete a photo they created' do
      visit_photo(photo)
      click_link("Edit #{photo.name}")
      click_link("Delete #{photo.name}")
      expect(current_path).to eq '/photos'
      expect(page).to_not have_content('Test')
    end
  end

  context 'user who did not upload photo is signed in' do

    before do
      sign_in(email: user_two.email, password: user_two.password)
    end

    it 'a user cannot edit or delete a photo they did not upload' do
      visit_photo(photo)
      expect(page).to_not have_content "Edit #{photo.name}"
    end
  end
end
