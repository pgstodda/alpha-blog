class EmailAddrValid < ActiveModel::Validator
  def validate(usrrec)
    unless usrrec.email.empty? || usrrec.email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      usrrec.errors.add :base, "Invalid email address format"
    end
  end
end

class User < ApplicationRecord
  validates :username, presence: true, length: { in: 3..20 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }
  validates_with EmailAddrValid
end