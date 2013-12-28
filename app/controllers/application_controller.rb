class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_college

  after_filter :restore_default_connection


  def raise_invalid_url
    raise "Invalid URL... Please try with Valid URL ..."
  end

  private


    def set_college
      user_type = (request.subdomains.last && request.subdomains.last != 'www') ? CollegeUser.new : SuperUser.new
      schema_name = College.find_by_sub_domain(request.subdomains.last).try(:sub_domain)
      raise_invalid_url if schema_name.nil? && user_type.is_company_user? && request.subdomains.last != 'www'
      SchemaUtils.add_schema_to_path schema_name
    end

    def restore_default_connection
      SchemaUtils.reset_search_path
    end

end

