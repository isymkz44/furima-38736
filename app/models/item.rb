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
            :shipping_date_id,     presence: true
  
  validates :category_id,
            :condition_id,
            :prefecture_id,
            :shipping_charge_id,
            :shipping_date_id,     numericality: { other_than: 0,message: "can't be blank" } 

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true
                                  #,numericality: { grater_than: 300, less_than_or_equal: 9999999 }
                                  #,format: { /\A[0-9]+\z/ }
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_date_id,    presence: true
  validates :shipping_charge_id,  presence: true
  validates :prefecture_id,       presence: true
  # validates :user,                presence: true 

  belongs_to :user
  # has_one :buy
  has_one_attached :image #複数イメージを保存する？としたら違うメソッドに

  
end
