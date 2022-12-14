class Post < ApplicationRecord
  belongs_to :posts, optional: true

  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: { in: 0..300 }
  validate :date_before_start  #開始日が現在の日付より早いかチェックする
  validate :date_before_finish  #終了日が開始日より早く設定できないように設定

  def date_before_start
    return if start_at.blank?
    errors.add(:start_at, "は今日以降のものを選択してください") if start_at < Date.today
  end

  def date_before_finish
    return if end_at.blank? || start_at.blank?
    errors.add(:end_at, "は開始日以降のものを選択してください") if end_at < start_at
  end

end
