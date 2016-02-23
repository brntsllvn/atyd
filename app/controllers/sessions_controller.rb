class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id

    # subscriber_hash = Digest::MD5.hexdigest(user.email.downcase)
    # params = {:status=>"subscribed", 
    #           :language=>"en", 
    #           :email_address=>user.email.downcase, 
    #           :merge_fields=>{:FNAME=>user.name, :LNAME=>"TEST"}}
    
    # @gibbon = Gibbon::Request.new
    # @gibbon.lists(ENV["MAILCHIMP_LIST_ID_REAL"]).members(subscriber_hash).upsert(body: params)

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
