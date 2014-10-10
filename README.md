# hexo cookbook

Installs Hexo with optional demo blog.

##Requirements

### Cookbooks

- [nodejs ](https://github.com/redguide/nodejs)

##Attributes

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node[:hexo][:blogs_root]</code></td>
    <td>Directory holding one or multiple hexo blogs.</td>
    <td><em>/blogs</em></td>
  </tr>
  <tr>
    <td><code>node[:hexo][:install_demo]</code></td>
    <td>True to set up a working demo in /blogs/demo.</td>
    <td><em>true</em></td>
  </tr>  
  <tr>
    <td><code>node[:hexo][:theme_git_url]</code></td>
    <td>URL to theme repository used by the demo.</td>
    <td><em>https://github.com/hexojs/hexo-theme-light.git</em></td>
  </tr> 
  <tr>
    <td><code>node[:hexo][:theme_git_url]</code></td>
    <td>IP-address used by the demo when running `hexo server`</td>
    <td><em>localhost</em></td>
  </tr>
</table>

##Recipes

###hexo::default

Installs hexo.

Optionally installs and configures a working demo blog with theme in /blogs/demo.

##Links:

- http://hexo.io
- [vagrant-hexo](https://github.com/alt3/vagrant-hexo) blog server