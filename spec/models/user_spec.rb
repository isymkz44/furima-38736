require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'ニックネーム、メールアドレス、パスワード、お名前、お名前（カナ）、生年月日が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが被っている場合は登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが６文字以下では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが半角でない場合は登録できない' do
        @user.password = 'あいう123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは数字のみの場合では登録できない' do
        @user.password = '111111111111'
        @user.password_confirmation = '111111111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードが英字のみの場合は登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードとパスワード（確認）は、一致していないと登録できない' do
        @user.password = 'xxxxx1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '苗字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(漢字)を入力してください")
      end
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名(漢字)を入力してください")
      end
      it '苗字が全角でないと登録できない' do
        @user.first_name = 'AAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(漢字)は不正な値です')
      end
      it '名前が全角でないと登録できない' do
        @user.last_name = 'AAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('名(漢字)は不正な値です')
      end
      it 'お名前（カナ）の苗字が空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("セイ(カナ)を入力してください")
      end
      it 'お名前（カナ）の名前が空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メイ(カナ)を入力してください")
      end
      it 'お名前（カナ）の苗字が全角でないと登録できない' do
        @user.first_name_reading = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('セイ(カナ)は不正な値です')
      end
      it 'お名前（カナ）の名前が全角でないと登録できない' do
        @user.last_name_reading = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('メイ(カナ)は不正な値です')
      end
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
