class Item < ApplicationRecord

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_date_id,    presence: true
  validates :shipping_charge_id,  presence: true
  validates :prefecture_id,       presence: true
  validates :user,                presence: true

  belongs_to :user
  has_one :buy
end
