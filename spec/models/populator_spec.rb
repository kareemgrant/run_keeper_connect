require 'spec_helper'

describe Populator do
  before do
    @user = create(:user)
    @activity1 = create(:activity)
    @data = RunkeeperData.items
  end

  describe "#add_activity_list" do
    it "Background worker is called the correct number of times" do
      user_activities = [@activity1.activity_id]
      Resque.stub(:enqueue)
      Populator.stub(:get_user_activities).and_return(user_activities)
      Populator.add_activity_list(@data, @user)
      Resque.should_receive(:enqueue).exactly(44).times
    end
  end

  describe "#get_activity_id" do

  end

  describe "#create_activity" do

  end

end
