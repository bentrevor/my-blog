FactoryGirl.define do
  factory :entry do
    title "factory entry title"
    content "factory entry content"
  end

  factory :new_entry, class: Entry do
    title "new title"
    content "new content"
  end

  factory :first_entry, class: Entry do
    title "first title"
    content "first content"
  end

  factory :user do
    name "factoryuser name"
    email "factoryuser@email.com"
    password "factoryuserpw"
    password_confirmation "factoryuserpw"
  end
end