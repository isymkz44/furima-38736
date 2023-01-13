class Buy < ApplicationRecord
  belongs_to       :user
  belongs_to       :item
  has_one_attached    :address  
end
