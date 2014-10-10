# Exit on Windows platforms
return if node[:platform] == 'windows'

# Install hexo
execute "Install hexo" do
  user 'root'
  group 'root'
  command 'npm install hexo -g'
  not_if { ::File.exists?('/usr/bin/hexo')}
end

# Exit recipe if we don't need to set up the demo
return if node[:hexo][:install_demo] == false

# Initialize empty demo blog
execute "Inititialize demo" do
  user 'vagrant'
  group 'vagrant'
  command "hexo init #{node[:hexo][:blogs_root]}/demo"
  not_if { ::File.exists?("#{node[:hexo][:blogs_root]}/demo/_config.yml")}
end

# Install dependencies
execute "Install demo packages" do
  user 'vagrant'
  group 'vagrant'
  cwd "#{node[:hexo][:blogs_root]}/demo"
  environment ({'HOME' => '/home/vagrant'})
  command "npm install --no-bin-links"
  not_if { ::Dir.exists?("#{node[:hexo][:blogs_root]}/demo/node_modules")}
end

# Clone Light theme into /themes directory (using everything after last / as theme dir)
git 'Light theme' do
  user 'vagrant'
  group 'vagrant'
  repository node[:hexo][:theme_git_url]
  destination "#{node[:hexo][:blogs_root]}/demo/themes/" + node[:hexo][:theme_git_url].match(/^.*\/(.*)$/).captures[0]
  not_if { ::Dir.exists?("#{node[:hexo][:blogs_root]}/demo/themes/" + node[:hexo][:theme_git_url].match(/^.*\/(.*)$/).captures[0] )}
end

template "Demo configuration" do
  path "#{node[:hexo][:blogs_root]}/demo/_config.yml"
  source "_config.yml.erb"
  variables ({
    :vm_ip_address => node[:hexo][:ip_address],
    :theme_name => node[:hexo][:theme_git_url].match(/^.*\/(.*)$/).captures[0]
  })
end
