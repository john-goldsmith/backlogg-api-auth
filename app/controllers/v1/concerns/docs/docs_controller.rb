module V1

  module Concerns

    module Docs

      module DocsController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_root do
            key :swagger, '2.0'
            info do
              key :version, '0.1.0'
              key :title, 'Auth Microservice'
              key :description, ''
              key :termsOfService, 'http://backlogg.io/terms'
              contact do
                key :name, 'Backlogg API Team'
              end
              license do
                key :name, 'MIT'
              end
            end
            tag do
              key :name, 'auth'
              key :description, 'Auth operations'
              externalDocs do
                key :description, 'Find more info here'
                key :url, 'https://swagger.io'
              end
            end
            key :host, 'auth.backlogg.dev:3003'
            key :basePath, '/v1'
            key :consumes, ['application/json']
            key :produces, ['application/json']
          end

          # A list of all classes that have swagger_* declarations.
          SWAGGERED_CLASSES = [
            ApplicationController,
            V1::ApiController,
            V1::UsersController,
            Auth,
            self
          ].freeze

          def index
            render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
          end

        end

      end

    end

  end

end