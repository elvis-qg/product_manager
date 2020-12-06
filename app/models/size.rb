class Size < ApplicationRecord
  belongs_to :type
  has_many :products_variants, dependent: :destroy
end
