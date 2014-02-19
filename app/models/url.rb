class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :original_url, presence: true
  validates_format_of :original_url, :with => /\Ahttp:\/\/.+\.\w{3}\z/i
  before_save :generate_url


  def generate_url
    self.short_url = ("a".."z").to_a.sample(4).join("")
  end

end
