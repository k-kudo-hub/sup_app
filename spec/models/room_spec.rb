require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  # bundle exec rspec spec/models/room_spec.rb

  describe 'チャットルームの作成' do
    context 'チャットルーム作成がうまくいくとき' do
      it 'client_idがあれば作成できる' do
        expect(@room).to be_valid
      end
    end
  end
end
