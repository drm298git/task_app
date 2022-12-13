class Post < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :posts, optional: true

  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: { in: 0..300 }

  validate :start_end_check  #終了日が開始日より早く設定できないように設定
  validate :start_date_check  #開始日が現在の日付より早いかチェックする

  def start_end_check
    return if start_at.present? && end_at.present? 
    errors.add(:end_at, "は開始日時より遅い時間を選択してください。") if start_at < end_at
  end

  def start_date_check
    return if start_at.blank?
    errors.add(:start_at, "は今日以降のものを選択してください") if start_at < Date.today
  end


end
