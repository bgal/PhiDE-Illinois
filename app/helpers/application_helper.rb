module ApplicationHelper
  def generate_block(title,&block)
    title = '<div class="block big"><div class="titlebar"><h3>'.html_safe+title+'</h3><a href="#" class="toggle">&nbsp;</a></div>'.html_safe
    body = '<div class="block_cont" style="display: block; ">'.html_safe+capture(&block)+'</div></div>'.html_safe
    title+body
  end
end