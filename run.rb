require 'net/smtp'

emails = ['email@a.com', 'email@b.com'].shuffle
File.open("list.txt", 'w') {|f| f.write(Time.now.getutc) }

emails.each do |email| 
	verificationCode = (0...10).map { ('A'..'Z').to_a[rand(26)] }.join
	File.open("list.txt", 'a') {|f| f.write("\n#{verificationCode}") }

	message = <<MESSAGE_END
From: sender <sender@email.com>
To: receiver <receiver@receiver.com>
Subject: VOTE VERIFICATION CODE 

Your voting verification code is #{verificationCode}
MESSAGE_END

	Net::SMTP.start('your-smtp.serv.er', 80, 'localhost', 'your-actual@email.com', 'your-password') do |smtp|
	  smtp.send_message message, 'your-actual@email.com', 
	                             email
	end
end
