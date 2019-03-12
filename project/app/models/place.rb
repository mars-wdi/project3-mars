class Place < ApplicationRecord

    has_many :favorites
    has_many :users , through: :favorites
   has_many  :comments , dependent: :destroy
    validates :country, :presence => true
    validates :city, :presence => true
    validates :catogry, :presence => true
    validates :name, :presence => true

end
