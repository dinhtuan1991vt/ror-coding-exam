namespace :generate do
  task dummy_data: :environment do
    programming_languages = ['ruby', 'javascript', 'python', 'scala', 'kotlin', 'swift']
    programming_languages.each do |language|
      ProgrammingLanguage.create(name: language)
    end

    languages = ['vn', 'en', 'ja', 'fr', 'cn', 'kr']
    languages.each do |language|
      Language.create(code: language)
    end

    100.times do
      developer = Developer.new(email: Faker::Internet.email)
      if developer.save
        random_programming_languages = programming_languages.sample(rand(1..3))
        random_programming_languages.each do |name|
          programming_language = ProgrammingLanguage.find_by_name name
          next unless programming_language
          developer.developer_programming_languages.create(programming_language: programming_language)
        end

        random_languages = languages.sample(rand(1..3))
        random_languages.each do |code|
          language = Language.find_by_code code
          next unless language
          developer.developer_languages.create(language: language)
        end
      end
    end
  end
end