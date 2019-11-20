class Fach < ApplicationRecord
    has_many :jpostfachs, dependent: :destroy
    has_many :posts, through: :jpostfachs

    validates :name, presence: true, uniqueness: true
end
