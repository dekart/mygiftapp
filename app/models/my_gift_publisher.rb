class MyGiftPublisher < Facebooker::Rails::Publisher
  def gift_notification(from, to)
    self.send_as    :notification
    self.from       from
    self.recipients to
    self.fbml       "sent you a gift. " + link_to("Take it!", gifts_url)
  end
  
  def profile_block(user)
    send_as     :profile
    from        user
    recipients  user
    profile     render(:partial => "/profile/block.fbml.erb", :assigns => {:user => user})
  end
end
