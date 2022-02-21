class ApplicationController < ActionController::Base
  include ActionController::RequestForgeryProtection
  protect_from_forgery
end
