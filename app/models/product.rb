class Product < ApplicationRecord
  belongs_to :type
  has_many :product_variants, dependent: :destroy

  validates :name, presence: true
end
