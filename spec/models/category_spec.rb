require 'rails_helper'

describe Category do
  it { should have_many(:contacts) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
end