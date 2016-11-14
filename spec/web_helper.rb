
def upload_photo
  visit '/photos'
  click_link 'Upload photos'
  expect(current_path).to eq '/photos/new'
  fill_in 'Name', with: 'Loving life'
  fill_in 'Description', with: 'Such a nice afternoon'
  click_button 'Create Photo'
end

def visit_photo(photo)
  visit '/photos'
  click_link('View photo')
end

def visit_edit_comment(photo, comment)
  visit "photos/#{photo.id}/comments"
  click_link 'Edit comment'
end


def add_comment(comment)
  fill_in :comment_comment, with: comment.comment
  click_button 'Create Comment'
end

def sign_up(email: "test@example.com", password: "12345678")
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  fill_in('user_password_confirmation', with: password)
  click_button('Sign up')
end

def sign_in(email: "test@example.com", password: "12345678")
  visit('/')
  click_link('Sign in')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_button('Log in')
end

def upvote
  visit '/photos'
  click_link 'Upvote'
end

def downvote
  visit '/photos'
  click_link 'Downvote'
end
