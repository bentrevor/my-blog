class Entry < ActiveRecord::Base
  resourcify
  attr_accessible :content, :title

  validates :content, presence: true
  validates :title, presence: true


  def next
    @entry = Entry.where("id > ?", id).first
  end

  def prev
    @entry = Entry.where("id < ?", id).last
  end
end
