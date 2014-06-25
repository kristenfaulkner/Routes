class ContactShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  has_many :comments, as: :commentable
  
  validates :user_id, :contact_id, presence: true
  validates_uniqueness_of :user_id, :scope => :contact_id
end
