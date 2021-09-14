class Note < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 30 }, presence: true
  validates :body, length: { maximum: 1000 }

  before_validation :set_title

  def get_created_time
    (created_at + Time.zone_offset('EST')).strftime("%a %R")
  end

  private

  def set_title
    no_whitespace_title = self.title.clone.gsub(/\s+/, "") unless self.title == nil
    if (self.title == nil || no_whitespace_title == "") && self.body != nil
      self.title = self.body[0...30]
    end
  end
end
