require 'spec_helper'

describe ApplicationController do

  describe "require_current_user" do

    context "when current_user is nil" do

      it "not authenticate" do
        controller.stub(:current_user).and_return(nil)
        controller.should_receive(:not_authenticated)
        controller.require_current_user
      end
    end

    context "when current_user is present" do

      it "will authenticate" do
        current_user = double('user')
        controller.stub(:current_user).and_return(current_user)

        controller.should_receive(:require_current_user).and_return(current_user)
        controller.require_current_user
      end
    end
  end

end
