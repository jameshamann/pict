require 'rails_helper'

describe User do
  it {should have_many(:photos)}
  it {should have_many(:comments)}
end
