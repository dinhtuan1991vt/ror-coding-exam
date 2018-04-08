class SearchDeveloperService
  attr_reader :programming_language_id, :language_id

  def initialize(params={})
    @relation = Developer.includes(:programming_languages, :languages)
    @programming_language_id = params[:programming_language_id].presence
    @language_id = params[:language_id].presence
  end

  def call
    search_with_programming_language if programming_language_id
    search_with_language if language_id
    @relation
  end

  private
  def search_with_programming_language
    @relation = @relation.left_joins(:programming_languages).where('programming_languages.id = ?', programming_language_id)
  end

  def search_with_language
    @relation = @relation.left_joins(:languages).where('languages.id = ?', language_id)
  end
end