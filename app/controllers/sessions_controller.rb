class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def subscribe
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    
    subscriber_hash = Digest::MD5.hexdigest(current_user.email.downcase)
    params = {:status=>"subscribed", 
              :language=>"en", 
              :email_address=>current_user.email.downcase, 
              :merge_fields=>{:FNAME=>current_user.name, :LNAME=>"VIA-ATYD"}}
    gibbon = Gibbon::Request.new
    gibbon.lists(ENV["MAILCHIMP_LIST_ID_REAL"]).members(subscriber_hash).upsert(body: params)
    
    current_user.update_attributes(subscribed: true)
    flash.notice = 'Successfully subscribed!'

    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
