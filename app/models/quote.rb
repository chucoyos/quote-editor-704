class Quote < ApplicationRecord
  
  validates :name, presence: true
  
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
  
  # order quotes by id desc
  scope :ordered, -> { order(id: :desc) }

end
