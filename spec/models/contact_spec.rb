require 'rails_helper'

describe Contact do
  it { should have_one(:image).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
end