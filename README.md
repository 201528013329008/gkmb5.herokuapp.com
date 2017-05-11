# gkmb5.herokuapp.com
- 国壳漫步是基于ruby on rails 一款社区应用
基于
> Ruby: 2.2.3

>Rails: 4.2.5

>OS: Mac OSX 10.10.5

>后台服务器基于heroku

>静态资源在AWS S3

gem包
Devise (User management)

Bootstrap 3.0

Kaminari (Pagination)


提供 clone 学习交流

    git clone https://github.com/201528013329008/gkmb5.herokuapp.com.git
    bundle install
    rake db:setup
    rake db:migrate
    rails server # Starts on port 3000 use -p to change the port.

- 富本编辑器代码高亮问题的解决 
安装这个simditor这个gem，已经打包好所有 simditor需要 的assets了
1. 在Gemfile  加   gem 'simditor'
 2. bundle install
 3. 在application.js  加上: js //= require simditor //=
require simditor/simditor-fullscreen 注:我还加了 个
simditor-fullscreen的插件，使  esc切换全屏， 法专 注于写
作
4. 在application.css  加上*= require simditor
5. 在_form.html.erb可以这么写
<div class="sky-form">
  <%= form_for(@post) do |f| %>
  <fieldset>
    <section>
      <label class="label"><strong><%= t('posts.title')
%></strong></label>
<label class="input"><%=
f.text_field :title,placeholder: "这 输 标题..."%></ label>
    </section>
    <section>
    <label class="label"><strong><%= t('posts.body') %></
strong></label>
    <%= f.text_field :body, :type=> 'hidden'%>
    </section>
    <section>
    <label class="label"><strong>Tag</strong></label>
    <label class="input"><%= f.text_field :tag_list,
placeholder: t('videos.tagshint') %></label>
    </section>
                       
     
     <section class="pull-right">
    <%= f.submit t('posts.post'), :class => 'btn-u btn-
lg' %>
</section>
</fieldset>
  <% end %>
  </div>
  <% end %>
 <script type="text/javascript">
var editor = new Simditor({
  textarea: $('#post_body'),
  toolbar: ['title', 'bold', 'italic', 'underline',
'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote',
'code', 'table', 'link','image',
'|','hr','indent','outdent','alignment','fullscreen'],
placeholder: '这 输  字...', pasteImage: true,
fileKey: 'file',
upload: {
    url: '/photos',
    params: null,
    connectionCount: 3,
    leaveConfirm: 'Uploading is in progress, are you sure
to leave this page?'
}
});
</script>
上 的semditor是rubychina社区 的 但是你发布 的帖 浏览器不能解析html标签，解决 案是
在lib 创建 件夹action_view 件夹  创建 helpers 件夹中创建sanitize_help.rb 件
require 'active_support/core_ext/object/ try' 
                                           
 require 'action_controller/vendor/html- scanner' 
require 'action_view/helpers/tag_helper'  module ActionView 
# = Action View Sanitize Helpers  module Helpers #:nodoc: 
 
 
self.class.white_list_sanitizer.sanitize(ht ml, options).try(:html_safe) 
end 
# Sanitizes a block of CSS code. Used by +sanitize+ when it comes across a style attribute. 
def sanitize_css(style) 
self.class.white_list_sanitizer.sanitize_cs s(style) 
end   
def strip_tags(html) 
self.class.full_sanitizer.sanitize(html).tr y(:html_safe) 
end   
def strip_links(html) 
self.class.link_sanitizer.sanitize(html)  end 
module ClassMethods #:nodoc: 
module SanitizeHelper 
extend ActiveSupport::Concern   
def sanitize(html, options = {}) 
 attr_writer :full_sanitizer, :link_sanitize r, :white_list_sanitizer 
def sanitized_protocol_separator 
white_list_sanitizer.protocol_separator  end 
def sanitized_uri_attributes 
white_list_sanitizer.uri_attributes  end 
def sanitized_bad_tags  white_list_sanitizer.bad_tags 
end 
def sanitized_allowed_tags 
white_list_sanitizer.allowed_tags  end 
def sanitized_allowed_attributes 
white_list_sanitizer.allowed_attributes  end 
def
sanitized_allowed_css_properties 
white_list_sanitizer.allowed_css_properties  end 
def sanitized_allowed_css_keywords 
white_list_sanitizer.allowed_css_keywords  end 
def
sanitized_shorthand_css_properties 
white_list_sanitizer.shorthand_css_properti
es 
end 
 def sanitized_allowed_protocols 
white_list_sanitizer.allowed_protocols  end 
def
sanitized_protocol_separator=(value) 
white_list_sanitizer.protocol_separator =
value 
end   
def full_sanitizer  @full_sanitizer ||=
HTML::FullSanitizer.new 
end   
def link_sanitizer  @link_sanitizer ||=
HTML::LinkSanitizer.new 
end   
def white_list_sanitizer  @white_list_sanitizer ||=
HTML::WhiteListSanitizer.new 
end   
def
sanitized_uri_attributes=(attributes) 
HTML::WhiteListSanitizer.uri_attributes.mer ge(attributes) 
end   
def sanitized_bad_tags=(attributes)  HTML::WhiteListSanitizer.bad_tags.merge(att
 ributes) 
end   
def
sanitized_allowed_tags=(attributes) 
HTML::WhiteListSanitizer.allowed_tags.merge (attributes) 
end   
def
sanitized_allowed_attributes=(attributes) 
HTML::WhiteListSanitizer.allowed_attributes .merge(attributes) 
end   
def
sanitized_allowed_css_properties=(attribute s) 
HTML::WhiteListSanitizer.allowed_css_proper ties.merge(attributes) 
end   
def
sanitized_allowed_css_keywords=(attributes) 
HTML::WhiteListSanitizer.allowed_css_keywor ds.merge(attributes) 
end   
def
sanitized_shorthand_css_properties=(attribu tes) 
 HTML::WhiteListSanitizer.shorthand_css_prop erties.merge(attributes) 
end   
def
sanitized_allowed_protocols=(attributes) 
HTML::WhiteListSanitizer.allowed_protocols. merge(attributes) 
end  end 
end  end 
end
然后在你的视图中直接显 的时候
<%= sanitize(@post.body) %>
就可以完美过滤掉标签啦 
4.2 heroku默认不保存静态 件的解决 案
如果你 paperclip上传 件的话会默认存到 public  的system，如果你 carrierwave上 传 件的话会默认存到public  的 uploader， heroku会默认存两个 时， 件地 址就会失效
解决 案(paperclip):静态 件存储(亚马逊 s3) aws_sdk(gem 版本就okay)
信 卡注册 建bucket 写bucket policy 配置 产环境 id +密钥

