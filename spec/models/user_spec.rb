require 'rails_helper'
describe User do
  describe '#create' do
    it "nameが存在しない場合登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "nameが７文字以上の場合登録できない" do
      user = build(:user, name: "水瀬いのりさん")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end

    it "nameが６文字以下なら登録できる" do
      user = build(:user, name: "みなせいのり")
      user.valid?
      expect(user).to be_valid
    end
    
    it "emailが存在しない場合登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "同じemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが存在しない場合登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "passwordが存在してもpassword_confirmationが存在しない場合登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordが６文字以上なら登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "passwordが５文字以下だと登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "name, email, password, password_confirmationが全て入力されている場合登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end