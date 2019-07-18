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
end
