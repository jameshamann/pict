require 'rails_helper'

feature 'comments' do
  context 'comments don\'t exisit' do
    let!(:photo) { Photo.create(name: "Music", description: "Cool!") }
    scenario 'a visitor can add comments to an existing photo' do
      visit_photo(photo)
      click_link('Add comment')
      expect(current_path).to eq "/photos/#{photo.id}/comments/new"
      expect(page).to have_content('Add comment!')
      fill_in :comment_comment, with: "Looking good!"
      click_button 'Create Comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to have_content('Comment: Looking good!')

    end

  end


end
