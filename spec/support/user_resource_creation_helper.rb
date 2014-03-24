module UserResourceCreationHelper
  def create_user(args)
    params = args.fetch(:params)
    resource = DigitalMeasures::User.new(params)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  end
  
  def delete_user(args)
    username = args.fetch(:username)
    resource = DigitalMeasures::DeleteUser.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  end
  
  def create_user_schema(args)
    params = args.fetch(:params)
    resource = DigitalMeasures::UserSchema.new(params)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  end
  
  def assign_user_role(args)
    username = args.fetch(:username)
    resource = DigitalMeasures::UserRole.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  end
end
