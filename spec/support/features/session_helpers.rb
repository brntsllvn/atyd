module Features
  module SessionHelpers
    def sign_in_with_google(user)  
      page.set_rack_session(
      { 'provider' => 'google',
        'uid' => user.uid,
          'info' => {
            'name' => user.name,
            'email' => user.email,
            'image' => '123456789.png'
          },
          'credentials' => {
            'token' => user.oauth_token,
            'expires_at' => user.oauth_expires_at
          }
        }
      )
    end
  end
end