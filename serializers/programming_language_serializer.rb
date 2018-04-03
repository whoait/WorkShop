class ProgrammingLanguageSerializer < ActiveModel::Serializer
  attributes :id

  has_many :developer_programming_languages
	has_many :developer, through: :developer_programming_languages
end
