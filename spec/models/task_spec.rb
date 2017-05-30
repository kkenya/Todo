require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validate title' do
    context 'titleが2文字のとき' do
      let(:task) {build(:task, title: 'a'*2)}

      it '成功すること' do
        expect(task).to be_valid
      end
    end
    context 'titleが50文字のとき' do
      let(:task) {build(:task, title: 'a'*50)}

      it '成功すること' do
        expect(task).to be_valid
      end
    end
    context 'titleが空のとき' do
      let(:task) {build(:task, title: '')}

      it '失敗すること' do
        expect(task).to be_invalid
      end
    end
    context 'titleが１文字のとき' do
      let(:task) {build(:task, title: 'a')}

      it '失敗すること' do
        expect(task).to be_invalid
      end
    end
    context 'titleが51文字のとき' do
      let(:task) {build(:task, title: 'a'*51)}

      it '失敗すること' do
        expect(task).to be_invalid
      end
    end
  end
  describe 'validate memo' do
    context 'memoが200文字のとき' do
      let(:task){ build(:task, memo: 'a'*200)}

      it '成功すること' do
        expect(task).to be_valid
      end
    end
    context 'memoが201文字のとき' do
      let(:task) {build(:task, title: 'a'*201)}

      it '失敗すること' do
        expect(task).to be_invalid
      end
    end
  end
end
