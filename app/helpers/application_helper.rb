module ApplicationHelper
  def active_status_for matcher
    if request.path.match(/#{matcher}/) then 'active' end
  end

  def body_class
    [controller_name, action_name].compact.join(' ')
  end
end
