require 'rails_helper'

describe Photo do

  it {should have_many(:comments)}
  it {should belong_to(:user)}

end
