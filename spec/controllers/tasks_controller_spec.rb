require "rails_helper"

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do

    it "renders the :index view" do
      set_current_user()
      get :index
      expect(response).to render_template :index
    end

    it "returns a list of all the uncompleted tasks ordered by deadline" do
      user = Fabricate(:user)
      set_current_user(user)
      tasks = []
      tasks << Fabricate(:task, completed: true, deadline: Time.zone.now - 1.day, user_id: user.id)
      tasks << Fabricate(:task, deadline: Time.zone.now - 2.day, user_id: user.id)
      tasks << Fabricate(:task, deadline: Time.zone.now + 1.day, user_id: user.id)
      tasks << Fabricate(:task, completed: true, user_id: user.id)
      tasks << Fabricate(:task, user_id: user.id)
      get :index
      expect(assigns(:tasks)).to match_array([tasks[1], tasks[4], tasks[2]])
    end
  end

  describe 'PATCH #task_completed' do
    let(:user) { Fabricate(:user) }
    let(:task) { Fabricate(:task, user_id: user.id) }
    before do
      set_current_user(user)
    end
    it "should toggle the completed boolean field for any task" do
      patch :update_completed, id: task.id
      task.reload
      expect(task.completed).to be(true)
    end

    it "redirect to root_path after update" do
      patch :update_completed, id: task.id
      expect(response).to redirect_to (root_path)
    end
  end
end
