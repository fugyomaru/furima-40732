class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :family_name_kanji, presence: true,
                                format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' }
  validates :first_name_kanji, presence: true,
                               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name is invalid. Input full-width characters' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana is invalid. Input full-width katakana characters' }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers'
end
