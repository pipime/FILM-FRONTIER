class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews,   dependent: :destroy
  has_many :likes,     dependent: :destroy

  validates :name,     presence: true
  validates :email,    presence: true, uniqueness: true

  def self.search(search)
  	unless search
  	  return User.all
  	else
  	  return User.where(['name LIKE ?', "%#{search}%"])
    end
  end
end