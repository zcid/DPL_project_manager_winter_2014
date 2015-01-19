class User < ActiveRecord::Base
  has_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

 def generate_github_state!
    self.update_attributes(github_state: self.generate_github_state)
    self.github_state
  end

  def generate_github_state
    SecureRandom.hex
  end
end
