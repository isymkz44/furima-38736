class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date

  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_charge_id
    validates :shipping_date_id
    validates :image
    validates :name
    validates :description
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0,message:"を選択して下さい" } do
    validates :category_id
    validates :condition_id
    validates :shipping_date_id
    validates :shipping_charge_id
    validates :prefecture_id
  end
end
