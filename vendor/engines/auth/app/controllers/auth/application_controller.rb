require "dry/matcher/result_matcher"

module Auth
  class ApplicationController < ActionController::Base
    include Authentication

    def matcher = Dry::Matcher::ResultMatcher
  end
end
