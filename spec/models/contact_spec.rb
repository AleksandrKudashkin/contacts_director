require 'rails_helper'

describe Contact do
  it { should validate_presence_of(:first_name) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }
end