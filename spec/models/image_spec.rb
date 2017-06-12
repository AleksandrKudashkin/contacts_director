require 'rails_helper'

describe Image do
  it { should belong_to(:contact) }
  it { should validate_presence_of :file }
end
