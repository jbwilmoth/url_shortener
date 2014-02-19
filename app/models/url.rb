class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_url

  def generate_url
    self.short_url = ("a".."z").to_a.sample(4).join("")
  end

end
