class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_FULL_WIDTH_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]/
  VALID_FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :password,            format: { with: VALID_PASSWORD_REGEX }
    validates :first_name
    validates :last_name
    validates :first_name_reading
    validates :last_name_reading
    validates :nickname            
    validates :birthday
  end         

  with_options format: { with: VALID_FULL_WIDTH_REGEX } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: VALID_FULL_WIDTH_KANA_REGEX } do
    validates :first_name_reading
    validates :last_name_reading
  end

  has_many :items, dependent: :destroy
  has_many :buys, dependent: :destroy
end
