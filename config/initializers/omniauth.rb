Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['TIL_OMNIAUTH_GOOGLE_KEY'],
    ENV['TIL_OMNIAUTH_GOOGLE_SECRET'],
    access_type: 'online'
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?
