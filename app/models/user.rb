class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :logs, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :venues, through: :logs, dependent: :destroy
  has_many :messages, through: :chats, dependent: :destroy

  validates :user_alias, :first_name, :last_name, :email, presence: true
  validates :user_alias, uniqueness: true, length: { minimum: 5 }
end
