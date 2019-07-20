class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews,   dependent: :destroy
  has_many :likes,     dependent: :destroy

  validates :name,     presence: true
  validates :email,    presence: true, uniqueness: true

  attachment :profile_image

  acts_as_paranoid

  default_scope -> { order(name: :desc) }

  def self.search(search)
  	unless search
  	  return User.all
  	else
  	  return User.where(['name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%"])
    end
  end
end