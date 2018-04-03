class DeveloperProgrammingLanguageSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :developer
 	belongs_to :programming_language
end
