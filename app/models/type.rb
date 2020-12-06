class Type < ApplicationRecord
  has_many :colors, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_many :products, dependent: :destroy
end
