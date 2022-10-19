class Quote < ApplicationRecord

  has_many :line_item_dates, dependent: :destroy

  belongs_to :company
  
  validates :name, presence: true
  
  broadcasts_to ->(quote) { [quote.company, "quotes" ] }, inserts_by: :prepend
  
  # order quotes by id desc
  scope :ordered, -> { order(id: :desc) }

end
