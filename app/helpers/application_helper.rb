module ApplicationHelper
  def generate_block(title,&block)
    title = '<div class="block big"><div class="titlebar"><h3>'.html_safe+title+'</h3><a href="#" class="toggle">&nbsp;</a></div>'.html_safe
    body = '<div class="block_cont" style="display: block; ">'.html_safe+capture(&block)+'</div></div>'.html_safe
    title+body
  end
  
  def flash_name_to_class_map(name)
    return "error" if name == :error
    return "success" if name == :notice
    return "information"
  end
  
  def is_active_tab?(accepted_controllers)
    return 'class="activepage"'.html_safe if accepted_controllers.include? params[:controller]
  end
end