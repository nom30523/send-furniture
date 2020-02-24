json.text @comment.text
json.user_name @comment.user.name
json.post_created_at @comment.post.created_at.strftime("%Y-%m-%d %H:%M")