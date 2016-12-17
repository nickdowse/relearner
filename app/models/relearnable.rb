class Relearnable < ActiveRecord::Base

  include SuperMemo::SM2

  belongs_to :user

  scope :to_relearn_today, -> { where("next_repetition <= ?", Date.today.end_of_day)}

  before_create :reset_spaced_repetition_fields # included by the SRS gem
  after_create  :set_summary

  validates_uniqueness_of :reference, :scope => [:user_id]

  def reset_spaced_repetition_fields
    self.easiness_factor = 2.5
    self.number_repetitions = 0
    self.next_repetition = Date.today
  end

  def set_summary
    result = Smmrize.webpage({url: self.reference, length: 3})["sm_api_content"]
    self.update_attribute(:summary, result)
  end
end
