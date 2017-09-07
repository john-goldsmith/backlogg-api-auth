module V1

  class AuthSerializer < ApiSerializer

    include ActiveModel::Serialization

    attributes :token

    def token
      @token
    end

    def id
      nil
    end

  end

end