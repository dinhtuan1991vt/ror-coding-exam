class SearchDeveloperService
  attr_reader :keyword

  def initialize(params = {})
    @relation = Developer.includes(:programming_languages, :languages)
    @keyword = params[:keyword].presence
  end

  def call
    search_with_keyword if keyword
    @relation
  end

  private

  def search_with_keyword
  end
end