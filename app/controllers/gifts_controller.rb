class GiftsController < ApplicationController
  def index
    id = @facebook_session.user.id
    
    @sent_gifts     = Gift.find_all_by_sender_uid(id)
    
    @received_gifts = Gift.find_all_by_receiver_uid(id)
  end
  
  def new
    @gift = Gift.new
  end
  
  def create
    return redirect_to(new_gift_url) unless params[:ids].kind_of?(Array) and params[:ids].any?
    
    params[:ids].each do |id|
      @gift = Gift.new(
        params[:gift].merge(
          :sender_uid   => @facebook_session.user.id,
          :receiver_uid => id
        )
      )
      @gift.save
    end
    
    MyGiftPublisher.deliver_gift_notification(@facebook_session.user, params[:ids])
    MyGiftPublisher.deliver_profile_block(@facebook_session.user)
    
    flash[:success] = "Successfully sent!"
    
    redirect_to gifts_url
  end
end
