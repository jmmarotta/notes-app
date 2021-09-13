class Note < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 30 }, presence: true
  validates :body, length: { maximum: 1000 }

  before_validation :set_title

  private

  def set_title
    no_whitespace_title = self.title.clone.gsub(/\s+/, "")
    if no_whitespace_title == ""
      self.title = self.body[0...30]
      p self.title
    end
  end
end
