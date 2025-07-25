class Tag2 < ApplicationRecord
    has_many :clean_tag2s, dependent: :destroy
    has_many :cleans, through: :clean_tag2s
end
