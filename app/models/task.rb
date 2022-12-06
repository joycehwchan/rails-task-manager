class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true

  def truncate_details
    "#{details[0..15]}..."
  end
end
