class Cast < ApplicationRecord
	has_many :movies, dependent: :destroy
end
