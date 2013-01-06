FactoryGirl.define do
  factory :entry do
    title "factory entry title"
    content "factory entry content"
  end

  factory :new_entry, class: Entry do
    title "new title"
    content "new content"
  end
end