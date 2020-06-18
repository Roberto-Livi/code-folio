module ApplicationHelper

    def user_avatar(user)
        if user.profile_pic.attached?
            @avatar_user = image_tag(user.profile_pic, :style => "width: 25%; height: 25%;")
        elsif user.female?
            @avatar_user = image_tag("female.png", :style => "width: 25%; height: 25%;")
        elsif user.male?
            @avatar_user = image_tag("male.png", :style => "width: 25%; height: 25%;")
        elsif user.other?
            @avatar_user = image_tag("default.png", :style => "width: 25%; height: 25%;")
        end

        return @avatar_user
    end

    # def post_avatar(post)
    #     if post.image.attached?
    #         @post_image = image_tag(post.image, :style => "width: 25%; height: 25%;")
    #     end

    #     return @post_image
    # end

end

