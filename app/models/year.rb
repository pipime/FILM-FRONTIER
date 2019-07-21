class Year < ApplicationRecord
	has_many :movies, dependent: :destroy

	default_scope -> { order(year: :desc) }
end
