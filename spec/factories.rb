FactoryGirl.define do
  factory :entry do
    title "factory entry title"
    content "factory entry content"
  end

  factory :new_entry, class: Entry do
    title "different factory title"
    content "different factory content"
  end
end