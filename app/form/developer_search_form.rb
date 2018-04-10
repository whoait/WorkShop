# frozen_string_literal: true

class DeveloperSearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :language_id, Integer
  attribute :programming_language_id, Integer

  def search
    query = Developer.includes(:languages, :programming_languages)
    query = query.joins(:developer_languages).where(developer_languages: { language_id: language_id }) if language_id.present?
    query = query.joins(:developer_programming_languages).where(developer_programming_languages: { programming_language_id: programming_language_id }) if programming_language_id.present?
    query.order(created_at: :desc)
  end
end
