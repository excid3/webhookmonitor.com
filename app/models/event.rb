class Event < ApplicationRecord
  belongs_to :project, counter_cache: true

  def parsed
    if json?
      JSON.parse(body)
    elsif form?
      Hash[URI.decode_www_form(body)]
    else
      body
    end
  end

  def json?
    content_type =~ /json/
  end

  def form?
    content_type =~ /form/
  end
end
