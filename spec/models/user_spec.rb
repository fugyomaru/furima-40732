require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは同じものは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上じゃないと登録できない' do
        @user.password = 'ord1A'
        @user.password_confirmation = 'ord1A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordに半角英数字が混合でないと登録できない' do
        @user.password = 'passwordA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password is invalid. Include both letters and numbers')
      end

      it 'passwordが一致していないと登録できない' do
        @user.password = 'password1A'
        @user.password_confirmation = 'password1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'やまだりくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_name_kanjiが空だと登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end

      it 'first_name_kanjiが空だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'family_name_kanjiが漢字・ひらがな・カタカナでない場合登録できない' do
        @user.family_name_kanji = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji Last name is invalid. Input full-width characters')
      end

      it 'first_name_kanjiが漢字・ひらがな・カタカナでない場合登録できない' do
        @user.first_name_kanji = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji First name is invalid. Input full-width characters')
      end

      it 'family_name_kanaがカタカナでない場合登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Last name kana is invalid. Input full-width katakana characters')
      end

      it 'first_name_kanaがカタカナでない場合登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana First name kana is invalid. Input full-width katakana characters')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
