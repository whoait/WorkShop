# frozen_string_literal: true

namespace :dev do
  require 'factory_bot_rails'
  require 'faker'
  desc 'Generate test data'
  task :generate_data, [:number] => :environment do |_, args|
    setargs(args)

    %w[vn en jp lao].each do |f|
      Language.find_or_create_by(code: f)
    end

    %w[ruby php java net assembly].each do |f|
      ProgrammingLanguage.find_or_create_by(name: f)
    end

    programming_languages = ProgrammingLanguage.all
    languages = Language.all

    @args[:number].times do
      email = loop do
        email = Faker::Internet.email
        break email unless Developer.exists?(email: email)
      end

      FactoryBot.create :developer, email: email,
                                    programming_languages: programming_languages.sample(rand(5)),
                                    languages: languages.sample(rand(4))
    end
  end
end

def setargs(args)
  @args = {}
  @args[:number] = (args.number || 100).to_i
end
