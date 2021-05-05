require 'rails_helper'

RSpec.describe ClockEvent, type: :model do
  it { is_expected.to belong_to :user }

  let(:user) { FactoryBot.create :user }
  let!(:clock_event_1) { FactoryBot.create(:clock_event, check_in: DateTime.now, user: user) }
  let!(:clock_event_2) { FactoryBot.create(:clock_event, check_in: DateTime.now - 1.5, check_out: DateTime.now - 1, user: user) }

  describe 'scopes' do
    describe '.incomplete' do
      it 'returns those events which are yet to be checked out' do
        expect(described_class.incomplete).to match_array([clock_event_1])
      end
    end

    describe '.completed' do
      it 'returns those events which are yet to be checked out' do
        expect(described_class.completed).to match_array([clock_event_2])
      end
    end
  end

  describe '#completed?' do
    context 'when record has check out time' do
      it 'returns true' do
        expect(clock_event_2.completed?).to eq(true)
      end
    end

    context 'when record does not have check out time' do
      it 'returns false' do
        expect(clock_event_1.completed?).to eq(false)
      end
    end
  end
end
