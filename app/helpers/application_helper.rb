module ApplicationHelper
  def menu_link_to( item )
    if current_page?( item[:link] )
      raw "<span class=\'current_page\'>" + item[:name] + "</span>"
    elsif item[:disabled]
      raw "<span class=\'disabled\'>" + item[:name] + "(工事中)</span>"
    elsif item[:method]
      link_to(item[:name], item[:link], :method => item[:method])
    else
      link_to(item[:name], item[:link])
    end
  end

  def allow_to_admin_user_only
   if !current_user || current_user.role_id != 1
    redirect_to :user_root
    return
   end
  end

  def allow_to_shop_clerks_only
   if !current_user || current_user.role_id != 2
    redirect_to :user_root
    return
   end
  end
end
