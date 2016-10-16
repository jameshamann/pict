require 'rails_helper'

feature 'photos' do
  context 'no photo\'s have been added' do
    scenario 'should display a link for visitors to add photos' do
      visit '/photos'
      expect(page).to have_content('Upload a photo')
      expect(page).to have_content('No photos yet!')
    end
  end
  context 'Photos have been added' do
    before do
      Photo.create(name: 'Eating out!', description: 'Loved the atmosphere!')
    end

    scenario 'displaying photos' do
      visit '/photos'
      expect(page).to have_content('Eating out!')
      expect(page).not_to have_content('No photos yet!')
    end
  end

  context 'Creating and uploading photos' do
    scenario 'a visitor can fill out a form, upload a photo and display the uploaded photo' do
      visit '/photos'
      click_link 'Upload a photo'
      expect(current_path).to eq '/photos/new'
      fill_in 'Name', with: 'Loving life'
      fill_in 'Description', with: 'Such a nice afternoon'
      attach_file "photo_avatar", './public/Glitch.jpg'
      click_button 'Create Photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Loving life'
    end
  end
end
