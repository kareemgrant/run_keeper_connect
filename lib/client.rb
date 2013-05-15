module Client
  module API
    extend self

    def get_runs(access_token, user)
      # refactor to remove the need to make two api calls to get activites
      user = Runkeeper::User.new(access_token)
      runs = user.fitness_activities_feed.body.to_hash
      Populator.add_activity_list(runs, user)
    end

    def get_run_detail(access_token)
      user = Runkeeper::User.new(access_token)
      run_detail = user.fitness_activities(id: params[:id]).body.to_hash
      Populator.add_activity_detail(run_detail, user)
    end
  end
end
