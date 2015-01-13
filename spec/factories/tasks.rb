FactoryGirl.define do
  factory :task do
    title 'Task one'
    description 'MyText'
    deadline '2014-12-18'
    is_completed false
  end

  factory :another_task, parent: :task do
    title 'Another thing to do'
    description 'MyText'
    deadline '2014-12-18'
    is_completed false
  end
end