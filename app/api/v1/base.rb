module V1
  class Base < APIBase
    version "v1", using: :path
    mount UserAPI
  end
end
