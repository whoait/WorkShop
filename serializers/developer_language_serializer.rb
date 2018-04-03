class DeveloperLanguageSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :developer
  belongs_to :language
end
