property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :create

action :create do
  return if profile_options.nil?

  profile_address = profile_options['address']
  profile_username = profile_options['username']
  profile_password = profile_options['password']
  profile_directory = profile_options['directory']

  profile_repositories = profile_options['repositories']
  unless profile_repositories.nil?
    profile_repositories.each do |profile_repository_name, profile_repository_options|
      gusztavvargadr_workstations_svn_repository profile_repository_name do
        base_address profile_address.to_s
        base_directory profile_directory
        repository_username profile_username
        repository_password profile_password
        repository_options profile_repository_options
        action :checkout
      end
    end
  end
end