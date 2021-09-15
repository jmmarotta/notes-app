class Note < ApplicationRecord
  belongs_to :user
  # The note title should not be longer than 30 characters
  # the title is required
  validates :title, length: { maximum: 30 }, presence: true
  # The body should not be longer than 1000 characters
  validates :body, length: { maximum: 1000 }
  # The body should note be longer
  before_validation :set_title
  
  # Calculate the created at string for use in view
  def get_created_time
    (created_at + Time.zone_offset(Time.now.zone)).strftime("%a %R")
  end

  private

  # A title is not required, but it should be defaulted to the first 30 characters of the note’s
  # body
  def set_title
    no_whitespace_title = self.title.clone.gsub(/\s+/, "") unless self.title == nil
    if (self.title == nil || no_whitespace_title == "") && self.body != nil
      self.title = self.body[0...30]
    end
  end
end
