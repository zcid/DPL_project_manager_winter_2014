class Task < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

end
