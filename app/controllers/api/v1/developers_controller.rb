# frozen_string_literal: true
module Api::V1
  class DevelopersController < Api:: BaseController
    def index
      developer = Developer.all

      render json: developer, include: [:languages, :programming_languages]
    end
  end
end