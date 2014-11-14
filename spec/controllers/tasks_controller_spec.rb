require "rails_helper"

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

    it "returns a list of all the tasks created" do
      user = Fabricate(:user)
      tasks = []
      3.times do
        tasks << Fabricate(:task, user_id: user.id)
      end
      get :index
      expect(assigns(:tasks)).to match_array([tasks[0], tasks[1], tasks[2]])
    end
  end
end
