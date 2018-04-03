# frozen_string_literal: true

namespace :dev do
  require 'factory_bot_rails'
  require 'faker'
  desc 'Generate test data'
  task :generate_data, [:number] => :environment do |_, args|
    setargs(args)
    language_codes = %w[vn en jp lao]
    programming_language_codes = %w[ruby php java net assembly]
    @args[:number].times do
      email = Faker::Internet.email
      developer = FactoryBot.create(:developer, email: email)
      languages = language_codes.sample(rand(4))
      languages.each do |f|
        language = Language.find_or_create_by(code: f)
        DeveloperLanguage.find_or_create_by(developer_id: developer.id, language_id: language.id)
      end
      programming_languages = programming_language_codes.sample(rand(5))
      programming_languages.each do |f|
        program = ProgrammingLanguage.find_or_create_by(name: f)
        DeveloperProgrammingLanguage.find_or_create_by(developer_id: developer.id, programming_language_id: program.id)
      end
    end
  end
end

def setargs(args)
  @args = {}
  @args[:number] = (args.number || 1).to_i
end
