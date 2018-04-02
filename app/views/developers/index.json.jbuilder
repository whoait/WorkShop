# frozen_string_literal: true

json.array! @developers, partial: 'developers/developer', as: :developer
