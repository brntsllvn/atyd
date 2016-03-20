class SubscriptionsController < ApplicationController

  def subscribe
    subscriber_first = subscription_params[:first_name]
    subscriber_last = subscription_params[:last_name]
    subscriber_email = subscription_params[:email].downcase

    subscriber_hash = Digest::MD5.hexdigest(subscriber_email)
    params = {:status=>"subscribed", 
              :language=>"en", 
              :email_address=>subscriber_email, 
              :merge_fields=>{:FNAME=>subscriber_first, :LNAME=>subscriber_last}}
    gibbon = Gibbon::Request.new
    gibbon.lists(ENV["MAILCHIMP_LIST_ID_REAL"]).members(subscriber_hash).upsert(body: params)
    
    flash[:message] = 'Subscribed. Thanks!'

    redirect_to root_path
  end

  private
    def subscription_params
      params.permit(:email, :first_name, :last_name)
    end

end