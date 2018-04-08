class DeveloperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  attribute :programming_languages do |object|
    object.programming_language_list
  end

  attribute :languages do |object|
    object.language_list
  end
end