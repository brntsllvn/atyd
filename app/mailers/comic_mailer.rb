class ComicMailer < ApplicationMailer
  default from: 'acetheyellowdog@gmail.com'
 
  def new_comic
    mail(to: 'brntsllvn@gmail.com', subject: 'Ace The Yellow Dog: New Comic')
  end
end
