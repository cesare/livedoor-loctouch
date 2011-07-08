require 'oauth2'
require 'json'
require 'hashie'

require 'livedoor/loctouch/user'
require 'livedoor/loctouch/category'
require 'livedoor/loctouch/spot'
require 'livedoor/loctouch/relationship'
require 'livedoor/loctouch/touch'
require 'livedoor/loctouch/note'

module Livedoor
  class Loctouch
    include Livedoor::Loctouch::User
    include Livedoor::Loctouch::Category
    include Livedoor::Loctouch::Spot
    include Livedoor::Loctouch::Relationship
    include Livedoor::Loctouch::Touch
    include Livedoor::Loctouch::Note
    
    
    #
    # constants
    #
    API_DOMAIN = 'api.loctouch.com'
    API_VERSION = 'v1'
    DEFAULT_USER_AGENT = "Ruby/Livedoor::Loctouch"


    #
    # attributes
    #
    attr_accessor :client_id, :client_secret, :access_token, :options


    #
    # initializer
    #
    def initialize(client_id, client_secret, access_token, options = {})
      @client_id = client_id
      @client_secret = client_secret
      @token = access_token
      @options = options
    end


    #
    # public API methods
    #
    public

    def home_timeline(options = {})
      get('home_timeline', options)
    end

    
    #
    # misc
    #
    private

    def request_uri(path)
      "https://#{API_DOMAIN}/#{API_VERSION}/#{path}"
    end

    def client
      @client ||= OAuth2::Client.new(@client_id, @client_secret)
    end

    def access_token
      @access_token ||= OAuth2::AccessToken.new(client, @token)
    end

    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end
    
    def request(method, path, params)
      response = access_token.send(method, request_uri(path), params, headers)
      Hashie::Mash.new(JSON.parse(response))
    end
    
    def headers
      headers = default_headers
      fix_headers(headers)
    end

    def default_headers
      {
        'User-Agent' => options[:usr_agent] || DEFAULT_USER_AGENT,
      }
    end

    def fix_headers(headers)
      #
      # override this method in the subclasses if you'd like to add/modify request headers
      #
      headers
    end
  end
end
