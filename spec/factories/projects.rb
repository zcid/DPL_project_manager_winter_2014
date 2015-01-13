FactoryGirl.define do
  factory :project, class: Project do
    team "MyText"
    title 'MyString'
    description 'MyText'
    deadline '2014-12-18'
  end
end