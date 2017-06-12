require 'rails_helper'

describe User do
  it { should have_many(:contacts).dependent(:destroy) }
  it { should have_many(:categories).dependent(:destroy) }
end
