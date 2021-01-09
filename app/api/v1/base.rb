module V1
  class Base < APIBase
    version "v1", using: :path
    mount UserAPI
    mount StoreAPI
  end
end
