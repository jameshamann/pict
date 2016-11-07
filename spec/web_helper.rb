
def upload_photo
  visit '/photos'
  click_link 'Upload a photo'
  expect(current_path).to eq '/photos/new'
  fill_in 'Name', with: 'Loving life'
  fill_in 'Description', with: 'Such a nice afternoon'
  click_button 'Create Photo'
end

def visit_photo(photo)
  visit '/photos'
  click_link('View photo')
end
