class Contact < ActiveRecord::Base
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares
  
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: true
  validates_uniqueness_of :user_id, :scope => :email
  
  def self.contacts_for_user_id(user_id)
    sql = <<-SQL
    SELECT 
     *
    FROM
      contacts
    LEFT OUTER JOIN
      contact_shares
    ON
      contacts.id = contact_shares.contact_id
    WHERE 
      contacts.user_id = ? OR
      contact_shares.user_id = ?
    SQL
    
    Contact.find_by_sql(sql, [user_id, user_id])
  end
end
