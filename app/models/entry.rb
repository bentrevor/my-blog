class Entry < ActiveRecord::Base
  validates :content, presence: true
  validates :title, presence: true

  def next
    @entry = Entry.where("id > ?", id).order("id ASC").first
  end

  def previous
    @entry = Entry.where("id < ?", id).order("id DESC").first
  end
end
