class Location < ActiveRecord::Base
  #has_and_belongs_to_many :patient
  attr_accessible :code, :name
  validates :code, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 80 }
end
