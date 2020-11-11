require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'name', with: @user.name
      fill_in 'name-kana', with: @user.name_kana
      fill_in 'staff-number', with: @user.staff_number
      fill_in 'email', with: @user.email
      fill_in 'staff-number', with: @user.staff_number
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      find('#user_position_id').click
      find('#user_position_id > option[value="3"]').click
      find('#user_qualification_id').click
      find('#user_qualification_id > option[value="5"]').click
      find('#user_work_style_id').click
      find('#user_work_style_id > option[value="2"]').click
      fill_in 'staff-number', with: @user.staff_number
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログインしないと表示されない要素が表示されていることを確認する
      expect(page).to have_content('1週間以内に発生した事故')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'name', with: @user.name
      fill_in 'name-kana', with: @user.name_kana
      fill_in 'staff-number', with: @user.staff_number
      fill_in 'email', with: @user.email
      fill_in 'staff-number', with: @user.staff_number
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      find('#user_position_id').click
      find('#user_position_id > option[value="3"]').click
      find('#user_qualification_id').click
      find('#user_qualification_id > option[value="1"]').click
      find('#user_work_style_id').click
      find('#user_work_style_id > option[value="2"]').click
      fill_in 'staff-number', with: @user.staff_number
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # ログインしないと表示されない要素が表示されていることを確認する
      expect(page).to have_content('1週間以内に発生した事故')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end