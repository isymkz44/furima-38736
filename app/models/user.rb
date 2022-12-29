class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
          VALID_FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/
          VALID_FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/


  validates :password,            presence: true,                                
                                  format: { with: VALID_PASSWORD_REGEX,message:" is invalid. Include both letters and numbers"}
  validates :first_name,          presence: true, 
                                  format: { with: VALID_FULL_WIDTH_REGEX, message:"is invalid. Input full-width characters"}
  validates :last_name,           presence: true,
                                  format: { with: VALID_FULL_WIDTH_REGEX, message:"is invalid. Input full-width characters"}
  validates :first_name_reading,  presence: true,
                                  format: { with: VALID_FULL_WIDTH_KANA_REGEX, message:"is invalid. Input full-width katakana characters"}
  validates :last_name_reading,   presence: true,
                                  format: { with: VALID_FULL_WIDTH_KANA_REGEX, message:"is invalid. Input full-width katakana characters"}
  validates :email,               presence: true
  validates :nickname,            presence: true
  validates :birthday,            presence: true


  has_many :items
  has_many :buys


end
