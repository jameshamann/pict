require 'rails_helper'

feature 'editing comments' do

  let!(:photo) {Photo.create(name: 'Test', description: 'Test_Description', user_id: user.id) }
  let!(:comment) {Comment.create(comment: 'Great test!', photo_id: photo.id, user_id: user.id) }
  let!(:user) {User.create(email: "test@example.com", password: "1234567")}
  let!(:user_two) {User.create(email: "test_two@example.com", password: "12345678")}

  context 'a comment has been added' do

    before do
      sign_in(email: user.email, password: user.password)
    end

    it 'A user can edit a comment they created' do
      visit_photo(photo)
      click_link "Add comment"
      add_comment(comment: comment.comment)
      click_link "Edit #{comment.comment}"
      expect(current_path).to eq "/photos/#{photo.id}/comments/#{comment.id}/edit"
      fill_in :comment_comment, with: comment.comment
      click_button 'Update Comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to have_content 'Great test!'
    end

    it 'a user can delete a comment they created' do
      visit "/photos/#{photo.id}/comments"
      click_link "#{comment.comment}"
      click_link 'Delete comment'
      expect(current_path).to eq "/photos/#{photo.id}/comments"
      expect(page).to_not have_content 'Great test!'
    end
  end
end
