class Quote < ApplicationRecord

  belongs_to :company
  
  validates :name, presence: true
  
  broadcasts_to ->(quote) { [quote.company, "quotes" ] }, inserts_by: :prepend
  
  # order quotes by id desc
  scope :ordered, -> { order(id: :desc) }

end
