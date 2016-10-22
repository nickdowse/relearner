# encoding: UTF-8
class RelearnMailer < ActionMailer::Base

  def digest(user, relearnables)
    @user = user
    @relearnables = relearnables
    mail( :to         => @user.email,
          :bcc        => "me+relearnable_digest@nickdowse.co.nz",
          :subject    => "Relearn digest",
          'X-MC-Tags' => 'relearn_daily_digest' )
  end
end
