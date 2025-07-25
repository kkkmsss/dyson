class Tag < ApplicationRecord
    has_many :clean_tags, dependent: :destroy
    has_many :clean, through: :clean_tags
end
