class DevelopersController < ApplicationController
  def index
    @ruby_id = ProgrammingLanguage.find_by_name('ruby')&.id
    @english_id = Language.find_by_code('en')&.id
    @developers = SearchDeveloperService.new(params).call
  end
end