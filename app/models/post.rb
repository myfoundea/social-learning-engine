class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :fans, through: :favorites, source: :user

    has_many :jpostfachs, dependent: :destroy
    has_many :fachs, through: :jpostfachs

    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true
    validates :body, length: { maximum: 8000 }, presence: true
end
