class DashboardsController < ApplicationController
    def show
        # @auth ||= request.env['omniauth.auth']
        # omniauth = request.env["omniauth.auth"]
        # email = request.env['omniauth.auth']
        puts request.env['omniauth.auth'].to_json
        puts '====================================='
        # abort(@auth.to_json);
    end
  end