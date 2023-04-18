class ApplicationController < ActionController::API
  before_action :underscore_root_keys

  def underscore_root_keys
    params.transform_keys!(&:underscore)
  end
end
