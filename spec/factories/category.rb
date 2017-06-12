FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "MyCategory#{n}" }
    user nil
  end

  factory :invalid_category, class: 'Category' do
    name nil
    user nil
  end
end
