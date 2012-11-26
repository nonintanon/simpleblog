require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Comment.blueprint do 
  body { "Test Body dsfkljljdskfkldjs" }
  user { object.user || User.make! }
end

Photo.blueprint do 
  caption { "Test Caption #{sn} "}
  processing { false }
  user { object.user || User.make! }
end

Post.blueprint do 
  title { "Test Post #{sn}" }
  body  { "Test body dfkjdfskkjldfs" }
end

Subscription.blueprint(:post) do 
  user { object.user || User.make! }
  subscribable { object.subscribable || Post.make! }
end

Subscription.blueprint(:photo) do 
  user { object.user || User.make! }
  subscribable { object.subscribable || Photo.make! }
end

User.blueprint do 
  name { "Test User #{sn}" }
  email { "email#{sn}@testemail.com" }
  password { "secretsss" }
end
