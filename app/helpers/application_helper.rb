module ApplicationHelper

  def bootstrap_alert_class(flash_name)
    if flash_name == :notice
      "success"
    elsif flash_name == :error
      "error"
    else
      "info"
    end
  end
  
end
