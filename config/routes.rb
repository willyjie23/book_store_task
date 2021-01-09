Rails.application.routes.draw do
  mount APIBase => '/api'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
