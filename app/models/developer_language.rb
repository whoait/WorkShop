# frozen_string_literal: true

class DeveloperLanguage < ApplicationRecord
  belongs_to :developer, inverse_of: :developer_languages
  belongs_to :language, inverse_of: :developer_languages
end
