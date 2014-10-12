# hexo cookbook

[![Build Status](https://travis-ci.org/alt3-cookbooks/hexo.svg)](https://travis-ci.org/alt3-cookbooks/hexo)

Installs Hexo with optional themed demo blog.

#Supported platforms

  - ubuntu-10.04
  - ubuntu-12.04
  - ubuntu-14.04
  - centos-6.5
  - centos-7.0

# Attributes

- `node[:hexo][:blogs_root]` - Path of root directory holding one or multiple hexo blogs.
- `node[:hexo][:install_demo]` - Boolean for installing a themed demo.
- `node[:hexo][:theme_git_url]` - URL to hexo theme repository (used by the demo)
- `node[:hexo][:ip_address]` - IP address used by running `hexo server` in the demo directory

#Recipes

##hexo::default

Installs hexo with optional themed demo blog.

#Links:

- http://hexo.io
- [vagrant-hexo](https://github.com/alt3/vagrant-hexo) blog server
