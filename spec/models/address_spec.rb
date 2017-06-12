require 'rails_helper'

describe Address do
  it { should belong_to(:contact) }
  it { should validate_presence_of(:street_1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:postal_code) }
end
