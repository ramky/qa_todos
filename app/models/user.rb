class User < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :first_name, :last_name, :username

  def name
    first_name + ' ' + last_name
  end
end
