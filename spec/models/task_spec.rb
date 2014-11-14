require "rails_helper"

RSpec.describe Task, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:description)  }
  it { should validate_presence_of(:user)  }

  describe "#my_deadline" do
    let(:user) { Fabricate(:user) }

    it "should return a friendly date for time in the past" do
      task = Fabricate(:task, deadline: Time.zone.now - 1.day, user_id: user.id)
      expect(task.my_deadline).to eq("1 day ago")
    end

    it "should return a friendly date for time in the future" do
      task = Fabricate(:task, deadline: (Time.zone.now + 1.day), user_id: user.id)
      expect(task.my_deadline).to eq("1 day from now")
    end
  end
end
