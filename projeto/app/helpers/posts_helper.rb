module PostsHelper
    def teste(n, post)
        if(post.id.nil?)
            return n
        else
            return teste(n+1, Post.find(post.post_id))
        end
    end
end
