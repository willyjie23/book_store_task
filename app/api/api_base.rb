require 'grape-swagger'

class APIBase < Grape::API
  format :json
  content_type :json, "application/json"
  default_error_status 400

  mount V1::Base

  add_swagger_documentation
end
