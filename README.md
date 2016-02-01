# VerifiedVote
####A Ruby script that emails verification codes that could be used for anonymised voting.

This is a Ruby script that generates a list of verification codes that could be sent to a list of email addresses for the use of voting.

Verification codes get saved to a text file **list.txt**.

The list of emails is shuffled before the generated codes are sent, so the person who runs the script has the list of codes but doesn't know which code went to whom.
