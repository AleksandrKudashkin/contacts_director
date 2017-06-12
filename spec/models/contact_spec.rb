require 'rails_helper'

describe Contact do
  it { should have_one(:image).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
  it { should accept_nested_attributes_for :image }
end