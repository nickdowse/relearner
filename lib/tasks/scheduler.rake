desc "Send daily digest to our users"
task send_daily_digest: :environment do
  puts "Sending production daily digest"
  User.send_user_digests
  puts "Production daily digest has been sent"
end
