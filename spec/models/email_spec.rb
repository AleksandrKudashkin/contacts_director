require 'rails_helper'

describe Email do
  it { should belong_to(:contact) }
  it { should validate_presence_of(:address) }
end
