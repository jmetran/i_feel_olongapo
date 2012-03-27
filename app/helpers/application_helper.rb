module ApplicationHelper

  def yield_for(content_sym, default = "")
    content_for?(content_sym) ? content_for(content_sym) : default
  end


  def initialize_meta(options = {})
    for option in options
      content_for(option[0], option[1] )
    end
  end

end
