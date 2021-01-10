module V1
  class Base < APIBase
    version 'v1', using: :path

    mount BookAPI
    mount StoreAPI
    mount UserAPI
  end
end
