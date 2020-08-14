class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    zenkaku_ja = /\A[ぁ-んァ-ン一-龥]/
    katakana = /\A[ァ-ヶー－]+\z/
    email = /\A\S+@\S+\.\S+\z/
    password = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :first_name, format: { with: zenkaku_ja }
    validates :last_name, format: { with: zenkaku_ja }
    validates :first_name_reading, format: { with: katakana }
    validates :last_name_reading, format: { with: katakana }
    validates :email, format: { with: email }
    validates :password, format: { with: password }
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
  end
end
