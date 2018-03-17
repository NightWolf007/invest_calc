# frozen_string_literal: true

# Base app model class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
