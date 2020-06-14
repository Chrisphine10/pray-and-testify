class Post < ApplicationRecord
	belongs_to :user
	has_one :testimony, dependent: :destroy
end
