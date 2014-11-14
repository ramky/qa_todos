class Task < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :user

  validates_presence_of :title, :description, :user

  def my_deadline
    deadline = time_ago_in_words(self.deadline)
    if self.deadline < Time.now
      "#{deadline} ago"
    else
      "#{deadline} from now"
    end
  end
end
