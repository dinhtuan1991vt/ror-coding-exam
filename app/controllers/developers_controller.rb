class DevelopersController < ApplicationController
  def index
    @developers = SearchDeveloperService.new(params).call
  end
end