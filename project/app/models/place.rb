class Place < ApplicationRecord
    validates :country, :presence => true
    validates :city, :presence => true
    validates :catogry, :presence => true
    validates :name, :presence => true

end
