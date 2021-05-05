require 'rails_helper'

RSpec.describe ClockEventsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let!(:clock_event) { FactoryBot.create :clock_event, user: user, check_in: DateTime.now - 1.5, check_out: DateTime.now - 1 }

  before do
    sign_in user
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: clock_event.id }
    end

    it 'assigns @clock_event' do
      expect(assigns(:clock_event)).to eq(clock_event)
    end
    it 'renders the edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:update_params) do
      {
        id: clock_event.id,
        clock_event: {
          user_id: user.id,
          check_out: DateTime.now,
        }
      }
    end

    it 'successfully updates the record' do
      expect { patch :update, params: update_params }.to change { clock_event.reload.check_out }
    end

    it 'redirects to root path' do
      patch :update, params: update_params
      expect(response).to redirect_to root_path
    end
  end
end
