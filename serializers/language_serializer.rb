class LanguageSerializer < ActiveModel::Serializer
  attributes :id

  has_many :developer_languages
	has_many :developers, through: :developer_languages
end
