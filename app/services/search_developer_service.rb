class SearchDeveloperService
  attr_reader :programming_language, :language

  def initialize(params = {})
    @relation = Developer.includes(:programming_languages, :languages)
    @programming_language = params[:programming_language].presence
    @language = params[:language].presence
  end

  def call
    search_with_programming_language if programming_language
    search_with_language if language
    @relation
  end

  private

  def search_with_programming_language
    @relation = @relation.left_joins(:programming_languages)
                         .where('programming_languages.name = ?', programming_language)
  end

  def search_with_language
    @relation = @relation.left_joins(:languages)
                         .where('languages.code = ?', language)
  end
end