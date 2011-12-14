class Book < ActiveRecord::Base
  
  has_many :reservations
  
  validates :title, :presence => true, :uniqueness => true
  validates :authors, :presence => true

  validates_with IsbnValidator
  
  def reserved
    self.reservations.where(state: 'reserved').first
  end
  
  # Most popular books based on number of reservations
  def self.popular(limit = 20)
    self.joins(:reservations).
      group("reservations.book_id").
      select("*, count(reservations.book_id) as count").
      order("count desc").
      limit(limit)
  end
  
  def self.search_by_isbn(value)
    self.where(:isbn => value)
  end
  
  def self.search_by_authors(value)
    self.where("authors LIKE ?", "%#{value}%").order("authors asc, created_at desc")
  end
  
  def self.search_by_title(value)
    self.where("title LIKE ?", "%#{value}%").order("title asc, created_at desc")
  end
  
  def self.latest(updated_at = Time.now.prev_week, limit = 20)
  	self.where("updated_at > ?", updated_at).order("updated_at DESC, title").limit(limit)
  end  
end
