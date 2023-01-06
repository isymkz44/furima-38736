class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :Shipping_charge
  belongs_to :Shipping_date

  validates :category_id,
            :condition_id,
            :prefecture_id,
            :shipping_charge_id,
            :shipping_date_id,
            :image,               presence: true
  
  validates :category_id,
            :condition_id,
            :prefecture_id,
            :shipping_charge_id,
            :shipping_date_id,    numericality: { other_than: 0,message: "can't be blank" } 

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"is invalid" }
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_date_id,    presence: true
  validates :shipping_charge_id,  presence: true
  validates :prefecture_id,       presence: true

  belongs_to :user
  # has_one :buy
  has_one_attached :image

  
end
