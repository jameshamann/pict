def upload_photo
  visit '/photos'
  click_link 'Upload a photo'
  expect(current_path).to eq '/photos/new'
  fill_in 'Name', with: 'Loving life'
  fill_in 'Description', with: 'Such a nice afternoon'
  attach_file "photo_avatar", './public/Glitch.jpg'
  click_button 'Create Photo'
end
