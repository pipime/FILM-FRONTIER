class Review < ApplicationRecord
	belongs_to :user
	belongs_to :movie

	validates :body, presence: true

	default_scope -> { order(created_at: :desc) }
end
