module PostsHelper
  def listen_post_path(post)
    "/posts/#{post.id}/listen"
  end
end
