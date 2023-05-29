require "rails_helper"

describe "GET #index" do
    DatabaseCleaner.clean
    user = FactoryBot.create(:user)
    before { allow(controller).to receive(:current_user) { user } }
    it "populates an array of task" do
        @controller = TasksController.new
        sign_in :user, user
        task = FactoryBot.create(:task)
        get :index
        expect(assigns(:tasks)).to eq([task])
    end
end
