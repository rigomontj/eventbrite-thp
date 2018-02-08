class User < ApplicationRecord
  has_many :created_events, as: :creator , :class_name => "Event"
  has_and_belongs_to_many :attended_events, as: :attendee, :class_name => "Event"
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end
end
