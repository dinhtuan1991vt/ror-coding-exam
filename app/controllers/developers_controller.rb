class DevelopersController < ApplicationController
  def index
    @keyword = params[:keyword]
    @developers = SearchDeveloperService.new(params).call
  end
end