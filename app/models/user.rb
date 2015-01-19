class User < ActiveRecord::Base
  has_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  scope :with_github_state, ->(state_param) { where(github_state: state_param).where.not(github_state: nil) }

  def generate_github_state!
    self.update_attributes(github_state: self.generate_github_state)
    self.github_state
  end

  def generate_github_state
    SecureRandom.hex
  end
end
