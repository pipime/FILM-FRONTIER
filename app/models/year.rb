class Year < ApplicationRecord
	has_many :movies, dependent: :destroy
end
