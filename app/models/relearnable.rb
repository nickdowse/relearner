class Relearnable < ActiveRecord::Base

  belongs_to :user

  include SuperMemo::SM2

  before_create :reset_spaced_repetition_fields # included by the SRS gem

  def reset_spaced_repetition_fields
    self.easiness_factor = 2.5
    self.number_repetitions = 0
    self.next_repetition = Date.today
  end

end
