# frozen_string_literal: true

# Base app controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
