class DevelopersController < ApplicationController
  def index
    @programming_language = params[:programming_language]
    @language = params[:language]
    @developers = SearchDeveloperService.new(params).call
  end
end