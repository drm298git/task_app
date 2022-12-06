class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: { in: 0..300 }
  validate :start_end_check#終了日が開始日より早く設定できないように設定

  def start_end_check
    errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
    self.start_at < self.end_at 
  end

end