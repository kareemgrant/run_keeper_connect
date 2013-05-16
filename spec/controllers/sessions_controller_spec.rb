require 'spec_helper'

describe SessionsController do

  describe "#create" do
    it "saves user's access_token, provider and uid information" do

      env["omniauth.auth"] = {
        "provider" => "runkeeper",
        "uid" => 5234295,
        "credentials" => {"token" => "318092c9fa74468dba0507844d29cf4d", "expires"=>false}
      }

      post :create
      user = User.find_by_uid_and_provider(5234295, "runkeeper")
      expect(user.access_token).to eq("318092c9fa74468dba0507844d29cf4d")
    end
  end
end
