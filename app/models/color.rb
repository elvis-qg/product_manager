class Color < ApplicationRecord
  belongs_to :type
  has_many :product_variants, dependent: :destroy
end
