class Movie < ApplicationRecord

	paginates_per 7

	has_many :reviews, dependent: :destroy
	has_many :likes, dependent: :destroy

	belongs_to :genre
	belongs_to :year
	belongs_to :cast

	attachment :jacket_image

	validates :title, presence: true
	validates :summary, presence: true

	default_scope -> { order(title: :desc) }

	def self.search(search)
	  if search.present?
	  	Movie.joins(:cast).where(['title LIKE? OR cast LIKE?', "%#{search}%", "%#{search}%"])
	  else
	  	Movie.all
	  end
	end

	def liked_by?(user)
	  likes.where(user_id: user.id).exists?
	end
end
