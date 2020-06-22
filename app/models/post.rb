class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length {minimun: 250}
end
