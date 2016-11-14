require 'rails_helper'

feature 'Votes' do

  context 'a user is signed in' do
    before do
      sign_up
      upload_photo
    end

    it 'should allow a user to upvote a picture once' do
      upvote
      expect(page).to have_content "Upvote 1"
      upvote
      expect(page).to have_content "Upvote 1"
    end

    it 'should allow a user to downvote a picture once' do
      downvote
      expect(page).to have_content "Downvote 1"
      downvote
      expect(page).to have_content "Downvote 1"
    end
  end

  context 'a user must be signed in to upvote' do

    before do
      sign_up
      upload_photo
    end

    it 'will ask a user to sign in before upvoting or downvoting a photo' do
      click_link 'Sign out'
      upvote
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'Log in'
    end

  end

end
