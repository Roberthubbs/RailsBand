class Album < ApplicationRecord
  validates :title, :year, presence: true

  belongs_to :band,    
    foreign_key: :band_id,
    class_name: :Band

end    