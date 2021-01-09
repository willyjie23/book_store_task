require 'grape-swagger'

class APIBase < Grape::API
  format :json
  content_type :json, "application/json"
  default_error_status 400

  rescue_from ActiveRecord::RecordNotFound do
    error!({
      message: 'Record Not Found',
      error_code: 'record_not_found'
    }, 404)
  end

  rescue_from NoMethodError do
    error!({
      message: 'Unvalid input value',
      error_code: 'no_method_error'
    }, 400)
  end

  mount V1::Base

  add_swagger_documentation
end
