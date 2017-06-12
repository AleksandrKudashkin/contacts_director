require 'rails_helper'

describe Contact do
  it { should have_many(:emails).dependent(:destroy) }
  it { should have_many(:phones).dependent(:destroy) }
  it { should have_many(:urls).dependent(:destroy) }
  it { should have_many(:address).dependent(:destroy) }
  it { should have_one(:image).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
end