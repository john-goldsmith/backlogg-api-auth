module V1

  module Concerns

    module Docs

      module AuthController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_path '/' do

            operation :get do
              key :description, 'Returns all auth'
              key :operationId, 'getAllAuth'
              key :tags, [
                'auth'
              ]
              response 200 do
                key :description, 'auth response'
                schema do
                  key :type, :object
                  key :'$ref', :Auth
                end
                # key :examples, ''
              end
            end

            operation :post do
              key :description, 'Creates a new auth'
              key :operationId, 'createAuth'
              key :tags, [
                'auth'
              ]
              response 200 do
                key :description, 'Auth response'
                schema do
                  key :type, :object
                  key :'$ref', :Auth
                end
                # key :examples, ''
              end
            end

          end

          swagger_path '/{id}' do

            operation :get do
              key :description, 'Returns a specific auth'
              key :operationId, 'getAuth'
              key :tags, [
                'auth'
              ]
              response 200 do
                key :description, 'Auth response'
                schema do
                  key :type, :object
                  key :'$ref', :Auth
                end
                # key :examples, ''
              end
            end

            operation :put do
              key :description, 'Updates a specific auth'
              key :operationId, 'updateAuth'
              key :tags, [
                'auth'
              ]
              response 200 do
                key :description, 'Auth response'
                schema do
                  key :type, :object
                  key :'$ref', :Auth
                end
                # key :examples, ''
              end
            end

            operation :delete do
              key :description, 'Deletes a specific auth'
              key :operationId, 'deleteAuth'
              key :tags, [
                'auth'
              ]
              response 200 do
                key :description, 'Auth response'
                schema do
                  key :type, :object
                  key :'$ref', :Auth
                end
                # key :examples, ''
              end
            end

          end

        end

      end

    end

  end

end