require 'rails_helper'

feature 'comments' do
  context 'comments don\'t exisit' do
    let!(:photo) { Photo.create(name: "Music", description: "Cool!") }
    let!(:comment) {Comment.create(comment: 'Looking good!') }
    scenario 'a visitor can add comments to an existing photo' do
      visit_photo(photo)
      click_link('Add comment')
      expect(current_path).to eq "/photos/#{photo.id}/comments/new"
      expect(page).to have_content('Add comment!')
      add_comment(comment.comment)
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to have_content('Comment: Looking good!')
    end
  end
end
