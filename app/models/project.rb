class Project < ActiveRecord::Base
	has_many :tasks

	validates :team, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :deadline, presence: true

end
