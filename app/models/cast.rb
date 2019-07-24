class Cast < ApplicationRecord
	has_many :movies, dependent: :destroy

	default_scope -> { order(cast: :asc) }
end
