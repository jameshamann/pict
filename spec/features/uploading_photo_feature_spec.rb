require 'rails_helper'

feature 'photos' do

  before do
    sign_up
  end

  context 'no photo\'s have been added' do
    scenario 'should display a link for visitors to add photos' do
      visit '/photos'
      expect(page).to have_content('Upload photos')
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
    upload_photo
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'Loving life'
    end
  end
end
