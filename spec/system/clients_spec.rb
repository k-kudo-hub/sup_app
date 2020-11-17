require 'rails_helper'

RSpec.describe 'お客様新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @client = FactoryBot.build(:client)
    @detail = FactoryBot.build(:detail)
    @caregiver = FactoryBot.build(:caregiver)
  end
  context 'お客様新規登録ができるとき' do
    it '正しい情報を入力すればお客様新規登録ができてトップページに移動する' do
      # ログインする
      # visit new_user_session_path
      # fill_in 'email', with: @user.email
      # fill_in 'password', with: @user.password
      # find('input[name="commit"]').click
      # メニューボタンをクリックする
      # find('.menu').click
      # お客様新規登録のボタンがあることを確認する
      # find('.one-icon > a[href="/clients/new"]').click
      # お客様新規登録ページに移動する
      # フォームに情報を入力する
      # 次の項目へ進むボタンをクリックする
      # お客様（看護）情報入力画面にいることを確認する
      # フォームに情報を入力する
      # 次の項目へ進むボタンをクリックする
      # お客様（介護）情報入力画面にいることを確認する
      # フォームに情報を入力する
      # お客様新規登録ボタンをクリックする
      # 送信するとClientモデル、Detailモデル、Caregiverモデルのカウントが1上がることを確認する
      # トップページに遷移することを確認する
      # トップページに先ほど登録したお客様の名前があることを確認する
    end
  end
  context 'お客様新規登録ができないとき' do
    it '誤った情報ではお客様新規登録ができずに新規登録ページへ戻ってくる' do
      # ログインする
      # メニューボタンをクリックする
      # お客様新規登録のボタンがあることを確認する
      # お客様新規登録ページに移動する
      # フォームに誤った情報を入力する
      # 新規登録ページに戻されることを確認する
    end
  end
end