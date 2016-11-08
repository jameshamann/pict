require 'rails_helper'

feature 'editing comments' do
  context 'a comment has been added' do

    let!(:photo) {Photo.create(name: 'Test', description: 'Test_Description') }
    let!(:comment) {Comment.create(comment: 'Great test!', photo_id: photo.id) }

    scenario 'a visitor can view and edit a comment' do
      visit "/photos/#{photo.id}/comments"
      click_link 'Edit comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments/#{comment.id}/edit"
      fill_in :comment_comment, with: comment.comment
      click_button 'Update Comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to have_content 'Great test!'
    end

    scenario 'a visitor can delete a comment' do
      visit "/photos/#{photo.id}/comments"
      click_link 'Edit comment'
      click_link 'Delete comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to_not have_content 'Great test!'
    end
  end
end