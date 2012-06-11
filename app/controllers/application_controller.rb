class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :authenticate_user!, :except => :index
  before_filter :load_locale

  def load_locale
    if user_signed_in? && current_user.locale.present?
      I18n.locale = current_user.locale
    else
      I18n.locale = "pt-BR"
    end
  end
end
