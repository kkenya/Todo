require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate name' do
    context 'nameが2文字のとき' do
      let(:user) {build(:user, name: 'a'*2)}

      it '成功すること' do
        expect(user).to be_valid
      end
    end
    context 'nameが20文字のとき' do
      let(:user) {build(:user, name: 'a'*20)}

      it '成功すること' do
        expect(user).to be_valid
      end
    end
    context 'nameが空のとき' do
      let(:user) {build(:user, name: '')}

      it '失敗すること' do
        expect(user).to be_invalid
      end
    end
    context 'nameが１文字のとき' do
      let(:user) {build(:user, name: 'a')}

      it '失敗すること' do
        expect(user).to be_invalid
      end
    end
    context 'nameが21文字のとき' do
      let(:user) {build(:user, name: 'a'*21)}

      it '失敗すること' do
        expect(user).to be_invalid
      end
    end
  end
  describe 'validate password' do
    let(:user) {build(:user)}
    context 'passwordが存在するとき' do
      it '成功すること' do
        expect(user).to be_valid
      end
    end
    context 'passwordが空のとき' do
      let(:user){ build(:user, password: '')}

      it '失敗すること' do
        expect(user).to be_invalid
      end
    end
    context 'password_confimationが空のとき' do
      let(:user){build(:user, password_confirmation: '')}

      it '失敗すること' do
        expect(user).to be_invalid
      end
    end
  end

end
