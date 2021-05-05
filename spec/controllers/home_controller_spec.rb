require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let!(:clock_event_1) { FactoryBot.create(:clock_event, check_in: DateTime.now, user: user) }
  let!(:clock_event_2) { FactoryBot.create(:clock_event, check_in: DateTime.now - 1.5, check_out: DateTime.now - 1, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'assigns @clock_event' do
      expect(assigns(:clock_event)).to eq(clock_event_1)
    end

    it 'assigns the completed event into @clock_events' do
      expect(assigns(:clock_events)).to match_array([clock_event_2])
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end
end
