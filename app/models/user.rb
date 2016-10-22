class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations

  has_many :relearnables

  def send_digest
    items = relearnables

    RelearnMailer.digest(self, items).deliver_now
  end
end

