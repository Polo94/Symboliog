module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "SimplyPortfolio"
    @seo_keywords = "SimplyCoders portfolio rails fullstack"
  end

end
