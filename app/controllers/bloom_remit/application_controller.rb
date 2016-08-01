module BloomRemit
  class ApplicationController < ActionController::Base

    include Trailblazer::Operation::Controller

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def record_not_found
      render nothing: true, status: 404
    end

  end
end
