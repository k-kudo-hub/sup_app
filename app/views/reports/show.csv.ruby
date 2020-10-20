require 'csv'
require 'nkf'
csv_data = CSV.generate do |csv|
  csv << %w(id 名前 性別 生年月日 記録者 発生時刻 発生場所 種別 単独／介助 程度 事故の内容 事故対応 連絡 通院・入院した病院 報告説明日 説明担当者 説明内容 再発防止策 )
  csv << [
      @report.id,
      @report.client.name,
      @report.client.sex.name,
      @report.client.birth,
      User.find(@report.user_id).name,
      @report.occ_time,
      @report.place.name,
      @report.genre.name,
      Re.find(@report.res_id).name,
      @report.level.name,
      @report.content,
      @report.coping,
      @report.contact.name,
      @report.hospital,
      @report.desc_date,
      User.find(@report.desc_user).name,
      @report.desc_content,
      @report.count_content
  ]
end
NKF::nkf('--sjis -Lw', csv_data)