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
    programming_language_list = programming_language.strip.split
    developer_ids = Developer.joins(:programming_languages).where('programming_languages.name IN (?)', programming_language_list).pluck(:id)
    @relation = @relation.where(id: developer_ids)
  end

  def search_with_language
    language_list = language.strip.split
    developer_ids = Developer.joins(:languages).where('languages.code IN (?)', language_list).pluck(:id)
    @relation = @relation.where(id: developer_ids)
  end
end