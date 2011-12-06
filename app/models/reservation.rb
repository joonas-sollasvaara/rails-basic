class Reservation < ActiveRecord::Base
  
  STATES = %w( free reserved )
  
  validates :book_id, :presence  => true
  validates :email,   :presence  => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :state,   :inclusion => { :in => STATES }

  validates :book_id, :uniqueness => { 
                          :scope => :state, 
                          :message => 'book has been already reserved' 
                      }, 
                      :if => "state == 'reserved'"
  
  
end
