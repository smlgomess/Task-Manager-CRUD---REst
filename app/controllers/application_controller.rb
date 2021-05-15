require "application_responder"

class ApplicationController < ActionController::API
 # self.responder = ApplicationResponder
  #respond_to :html, :json

    include ActionController::MimeResponds
    respond_to? :html, :json
end
