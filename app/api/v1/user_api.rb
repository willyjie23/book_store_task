module V1
  class UserAPI < Base
    get :user do
      { status: '123' }
    end
  end
end
