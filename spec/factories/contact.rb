FactoryGirl.define do
  factory :contact do
    sequence(:first_name) { |n| "MyName#{n}" }
    user nil
    category nil
  end

  factory :invalid_contact, class: 'Contact' do
    first_name nil
    user nil
    category nil
  end
end
