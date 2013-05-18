require 'spec_helper'

describe Runkeeper::API do
  it "should exist" do
    expect(Runkeeper::API.class).to eq Module
  end

  context "#get" do
    before do

    end

    describe "Runkeeper user obj using /user path" do
      before do
        @user = double(uid: "5234295")
        @path = "user"
        @header = "application/vnd.com.runkeeper.User+json"
        @token = "318092c9fa74468dba0507844d29cf4d"
      end

      it "should fetch Runkeeper user object" do
        VCR.use_cassette 'rk_user' do
          rk_response = Runkeeper::API.get(@path, @header, @token)
          expect(rk_response.body.userID).to eq @user.uid.to_i
        end
      end
    end
  end
end
