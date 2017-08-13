require 'rails_helper'

RSpec.describe Speack, type: :model do
  context 'commentが2文字のとき' do
    let(:speack) {build(:speack, comment: 'a'*2)}
    it '成功すること' do
      expect(speack).to be_valid
    end
  end
  context 'commentが30文字のとき' do
    let(:speack) {build(:speack, comment: 'a'*30)}
    it '成功すること' do
      expect(speack).to be_valid
    end
  end
  context 'commentが空のとき' do
    let(:speack) {build(:speack, comment: '')}
    it '失敗すること' do
      expect(speack).to be_invalid
    end
  end
  context 'commentが1文字のとき' do
    let(:speack) {build(:speack, comment: 'a')}
    it '失敗すること' do
      expect(speack).to be_invalid
    end
  end
  context 'commentが31文字のとき' do
    let(:speack) {build(:speack, comment: 'a'*31)}
    it '失敗すること' do
      expect(speack).to be_invalid
    end
  end
end
