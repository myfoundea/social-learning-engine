module FavoritesHelper

    def fave_or_unfave_button(post, favorite)
      if post.user != current_user
        if favorite
          button_to "♡ #{@post.fans.size} Unlike", post_favorite_path(post, favorite), method: :delete, 
            class: "cursor-pointer hover:bg-white text-red-400 bg-red-100 p-2 border border-red-300 rounded-lg"
        else
          button_to "♥️ #{@post.fans.size}  Like", post_favorites_path(post), 
            class: "text-white hover:bg-red-600 bg-red-400 p-2 border border-red-300 rounded-lg cursor-pointer"
        end
      else
        content_tag(:div, "♥️ #{@post.fans.size}  Like", class: "text-white bg-red-400 p-2 border border-red-300 rounded-lg w-24 text-center")
      end
    end
    
end
