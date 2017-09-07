# See https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
# See http://sourcey.com/building-the-prefect-rails-5-api-only-app/


module V1

  class AuthController < ApiController

    # include V1::Concerns::Docs::AuthController

    ALGORITHM = 'HS256'
    AUD = 'client'
    ISS = 'backlogg'

    #
    # POST /issue
    #
    # @return [type] [description]
    def issue
      jwt = JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
      data = {
        jwt: jwt
      }
      respond_with data: data
    end


    #
    # POST /decode
    #
    # @return [type] [description]
    def decode
      jwt = JWT.decode(params[:jwt], Rails.application.secrets.secret_key_base, true, {iss: ISS, verify_iss: true, aud: AUD, verify_aud: true, algorithm: ALGORITHM})
      data = {
        payload: jwt[0],
        headers: jwt[1]
      }
      respond_with data: data
    end

    #
    # [payload description]
    #
    # @return [type] [description]
    def payload
      {id: params['id']}.reverse_merge! default_claims
    end

    def default_claims
      {
        exp: 24.hours.from_now.to_i,
        iss: ISS,
        iat: Time.now.to_i,
        aud: AUD
      }
    end

    #
    # [expired description]
    #
    # @return [type] [description]
    # def expired(jwt)
    #   Time.at(payload['exp']) < Time.now
    # end

    #
    # [self description]
    # @param payload [type] [description]
    #
    # @return [type] [description]
    # def valid_payload(payload)
    #   !expired(payload) && payload['iss'] == default_claims[:iss] && payload['aud'] == default_claims[:aud]
    # end

  end

end