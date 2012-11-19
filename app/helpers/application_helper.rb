module ApplicationHelper
  def active_status_for matcher
    if request.path.match(/#{matcher}/) then 'active' end
  end
end
