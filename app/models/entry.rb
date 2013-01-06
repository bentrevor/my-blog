class Entry < ActiveRecord::Base
  resourcify
  attr_accessible :content, :title

  validates :content, presence: true
  validates :title, presence: true
end
