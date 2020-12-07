class Product < ApplicationRecord
  belongs_to :type
  has_many :product_variants, dependent: :destroy

  validates :name, presence: { message: 'Name is required' }, uniqueness: { message: 'This name already exists'}
  validates :brand, presence: { message: 'Brand is required' }
end
