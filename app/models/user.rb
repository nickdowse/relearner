class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations

  has_many :relearnables

  attr_accessor :redirect_to_new

  def self.send_user_digests
    User.all.each do |u|
      u.send_digest
    end
  end

  def send_digest
    items = relearnables.to_relearn_today.limit(3)

    return if items.count == 0

    RelearnMailer.digest(self, items).deliver_now
    items.each do |item|
      item.process_recall_result(4)
      item.save
    end
  end
end

