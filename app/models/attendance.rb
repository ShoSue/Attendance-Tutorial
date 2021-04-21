class Attendance < ApplicationRecord
  
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  
  # 出勤じかんがない場合退勤時間は無効
  validate :finished_at_is_invalid_without_a_standard_at
  
  def finished_at_is_invalid_without_a_standard_at
    errors.add(:started_at,"が必要です") if started_at.blank? && finished_at.present?
  end
  
end