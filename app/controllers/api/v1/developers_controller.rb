class Api::V1::DevelopersController < ActionController::API
  def index
    developers = SearchDeveloperService.new().call
    render json: DeveloperSerializer.new(developers).serializable_hash
  end
end