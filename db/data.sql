PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
INSERT INTO "articles" VALUES(2,'千里之行始于足下','','<p>按照国际惯例，先来一次问候:<br></p><p><br></p><pre><code>NSLog(@"Hello World");&nbsp;</code></pre><p><br></p><p><br></p><ul><li>为什么会有这个博客&nbsp;</li></ul><blockquote><p>作为一名程序员，都有记录自己遇到的bug，学到的技术的习惯，所以，这个博客是用来记录我遇到的bug，学习的新知识，以及工作生活上觉得有意义的事情。</p></blockquote><p style="margin-left: 40px;"><br></p><p style="margin-left: 40px;"><br></p><ul><li>对这个博客有什么计划</li></ul><blockquote><p style="margin-left: 80px;"><span style="color: rgb(51, 51, 51); font-size: 16px;">计划</span><span style="color: rgb(51, 51, 51); font-size: 16px;">每周写一篇博文，不限内容，可以吐槽，可以是本周的工作感悟，也可以是学习的新知识，读书笔记等等，最重要的是每周一篇。技术类的博客的话，每个月必须要有一篇，不限制方向，但是必须是与技术相关的。</span></p></blockquote><p style="margin-left: 80px;"><span style="color: rgb(51, 51, 51); font-size: 16px;"><br></span></p><ul><li><span style="color: rgb(51, 51, 51); font-size: 16px;"><span style="color: rgb(51, 51, 51); font-size: 16px;">对这个博客有什么期许</span><br></span></li></ul><blockquote><p style="margin-left: 80px;">作为一名开发人员，技术是硬实力，而表达能力和沟通能力等一些软实力，在现在竞争如此激烈的开发行业也是十分重要的。希望能在写博客的工程中，提高自己的表达沟通能力，以提高自己的竞争力。毕竟不想当将军的士兵不是好士兵。<br></p></blockquote><p style="margin-left: 40px;"><br></p><p style="margin-left: 40px;"><br></p><ul><li>吐槽</li></ul><blockquote><p style="margin-left: 80px;">Ubuntu真的是坑，部署这个博客项目搞了4天都没搞定，换成centOS一个晚上就部署成功。不过成功了始终是好的，功夫不负有心人，总算是弄好了。经过一番努力成功之后获得的成就感真是让人身心愉悦啊。</p></blockquote><p style="margin-left: 40px;"><br></p><p style="margin-left: 40px;"><br></p><p style="margin-left: 40px;"><b>最后，在这里分享一句话：</b></p><blockquote><p style="margin-left: 40px;">天行健、君子以自强不息<br></p></blockquote>','','2017-05-15 14:10:26.674420','2017-05-16 13:14:56.923535');
INSERT INTO "articles" VALUES(3,'在CentOS 7 上部署 Ruby on Rails','','<p><span style="font-size: 16px;">&nbsp; &nbsp; &nbsp;在这里记录一下自己在CentOS7上面部署的过程。之前在Ubuntu上面部署，一直不成功，一气之下，重装了CentOS7，选择了</span><a href="http://nginx.org/" target="_blank">Nginx</a><span style="font-size: 16px;">作为反向代理，</span><span style="font-size: 16px;">&nbsp;</span><a href="https://rubygems.org/gems/unicorn/versions/4.9.0" target="_blank">Unicorn</a><span style="font-size: 16px;">作为rails sever的组合来完成部署,经过不懈努力终于成功部署。废话不多说，下面就是我部署的一些记录。</span></p><hr><p>1.更新操作系统</p><pre><code class="lang--1">$ yum update<br></code></pre><p>&nbsp; &nbsp;&nbsp;查看系统版本</p><pre><code>cat /etc/redhat-release</code></pre><p>&nbsp; &nbsp; &nbsp;</p><p>2.<span style="font-size: 16px;">安装 EPEL software</span></p><pre><code>$ yum install epel-release
$ yum repolist<br></code></pre><p><br></p><p>3.安装一些库和工具</p><pre><code>$ yum install curl-devel nano sqlite-devel libyaml-devel<br></code></pre><p><br></p><p><span style="font-size: 16px;">4. 安装 RVM，安装指定版本的 Ruby</span><br></p><pre><code>$ gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
$ curl _L https://get.rvm.io | bash -s stable
$ source /etc/profile.d/rvm.sh  #set up system environment for Ruby, 这步不可少
$ rvm reload
$ rvm install 2.3.0  #这里指定你想要使用的ruby版本<br></code></pre><p><span style="font-size: 16px;"><br></span></p><p><span style="font-size: 16px;">5. (天朝特色)把 gem source 改成ruby-china镜像以提高 rails 安装速度</span><br></p><pre><code>gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/<br></code></pre><p><br></p><p><span style="font-size: 16px;">6. 安装 node.js 作为 rails app 的 javascript 运行环境</span><br></p><pre><code>yum install nodejs<br></code></pre><p><br></p><p><span style="font-size: 16px;">7. 安装指定版本的 rails</span><br></p><pre><code>$ gem install bundler
$ gem install rails -v 5.0.1<br></code></pre><p><br></p><p><span style="font-size: 16px;">8. 安装 Nginx</span><br></p><pre><code>$ yum install nginx<br></code></pre><p><br></p><p>9. 安装 Unicorn<br></p><pre><code>$ gem install unicorn<br></code></pre><p><br></p><p>10. 创建一个新的 rails 项目或者将项目从 git 托管平台克隆到主机</p><pre><code>#进入项目目录，记住项目目录这一步很重要，牵扯到之后配置Nginx和Unicorn的成功与否
#我将项目放在 /var 下一个新建的rails文件夹里
$ cd /var
$ mkdir rails
$ cd /var/rails
$ rails new your_project #创建新项目
($ git clone https://github.com/xxx/your_project.git #或者将已有项目用git克隆过来)<br></code></pre><p><span style="font-size: 16px;"><br></span></p><p><span style="font-size: 16px;">11. 执行 bundle install</span><br></p><pre><code>$ cd /var/rails/your_project
$ bundle install --without development:test</code></pre><p><br></p><ul><li>接下来就是重点了，开始配置 Nginx 和 Unicorn：</li></ul><p><span style="font-size: 14px;"><br></span></p><p><span style="font-size: 14px;">1.首先在rails项目的根目录中找到文件夹 config，在里面创建文件 unicorn.rb 并写如下内容</span></p><pre><code>#注意项目的路径一定要写全写正确，不然配置不会成功
working_directory "/var/rails/your_project/"

pid "/var/rails/your_project/tmp/pids/unicorn.pid"

stderr_path "/var/rails/your_project/log/unicornerr.log"
stdout_path "/var/rails/your_project/log/unicornout.log"

#这里设置监听地址，将与Nginx配置关联
listen "/var/rails/your_project/tmp/sockets/unicorn.sock", :backlog =&gt; 64
listen 3032, :tcp_nopush =&gt; true

worker_processes 2

preload_app true

timeout 30

before_fork do |server, worker|
  # the following is highly recommended for Rails + "preload_app true"
  # as there''s no need for the master process to hold a connection
&nbsp; defined?(ActiveRecord::Base) and
&nbsp; &nbsp; ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
&nbsp; # the following is *required* for Rails + "preload_app true"
&nbsp; defined?(ActiveRecord::Base) and
&nbsp; &nbsp; ActiveRecord::Base.establish_connection
end

<br></code></pre><ul><li>然后配置 Nginx 与 Unicorn 之间的通讯<br></li></ul><p>先执行以下命令进入 Nginx 目录并找到 nginx.conf 文件<br></p><p><br></p><pre><code>$ cd /etc/nginx  #一般nginx安装完成之后所在路径，不熟悉linux的童鞋可以用whereis nginx命令来寻找路径
$ vi nginx.conf  #查看nginx.conf文件<br></code></pre><p>进入 nginx.conf 文件后按 i 开始编辑，以下为所需修改的相应内容:<br><br></p><pre><code>worker_processes 1;
events {
&nbsp; &nbsp; worker_connections 1024;
}

http {
	upstream unicorn_server {
	 &nbsp; &nbsp;server unix:/var/rails/your_project/tmp/sockets/unicorn.sock fail_timeout=0;
	}
	server {
	 &nbsp; &nbsp;listen &nbsp; &nbsp; &nbsp;80 default_server;
	 &nbsp; &nbsp;listen &nbsp; &nbsp; &nbsp;[::]:80 default_server;
	 &nbsp; &nbsp;server_name 你的域名或IP地址;
	 &nbsp; &nbsp;root &nbsp; &nbsp; &nbsp; &nbsp;/var/rails/your_project/public;

	 &nbsp; &nbsp;location / {
	 &nbsp; &nbsp; &nbsp; &nbsp;proxy_set_header X-Forwarded_For $proxy_add_x_forwarded_for;
	 &nbsp; &nbsp; &nbsp; &nbsp;proxy_set_header Host $http_host;
	 &nbsp; &nbsp; &nbsp; &nbsp;proxy_redirect off;
	 &nbsp; &nbsp; &nbsp; &nbsp;if (!-f $request_filename) {
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;proxy_pass http://unicorn_server;
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;
	 &nbsp; &nbsp; &nbsp; &nbsp;}
	 &nbsp; &nbsp;}

	 &nbsp; &nbsp;error_page 500 502 503 504 /500.html;
	 &nbsp; &nbsp; &nbsp; &nbsp;location = /500.html {
	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;root /var/rails/your_project/public;
	 &nbsp; &nbsp; &nbsp; &nbsp;}
	}
}<br></code></pre><p><br></p><p><br></p><hr><p>到这里基本都配置完了，只需要启动sever然后让项目跑起来了，</p><p><span style="font-size: 16px;">进入 rails 项目目录，然后</span></p><pre><code>$ RAILS_ENV=production bundle exec rake assets:precompile  #这一步不可少，不然asset pipeline不工作<br></code></pre><p>接着启动 Unicorn 和 Nginx<br></p><pre><code>$ unicorn_rails -c config/unicorn.rb -D -E production
$ service nginx start<br></code></pre><p><br></p><p>这样，应该已经可以访问你的项目了。</p><p><br></p><hr><p><br></p><p>再来写一下更新代码之后，如何重启服务：</p><pre><code>ps auwx | grep unicorn<br></code></pre><p><br></p><p>找出正在运行的unicorn进程，然后kill掉：</p><pre><code>kill -9 1601</code></pre><p><br></p><p>然后再：</p><pre><code>$ RAILS_ENV=production bundle exec rake assets:precompile  #这一步不可少，不然asset pipeline不工作</code></pre><p><br></p><p>再把server启动就可以了</p><pre><code>unicorn_rails -c config/unicorn.rb -D -E production<br></code></pre>','','2017-05-18 13:48:08.566705','2017-05-18 13:52:02.579287');
INSERT INTO "articles" VALUES(4,'Web前端之Bootstrap(1)','','<h2>什么是Bootstrap?</h2><p>1、Bootstrap是当下最流行的前端框架(界面工具集)</p><p>2、特点是灵活简洁，代码优雅，美观大方</p><p>3、其目的是为了让Web开发更敏捷</p><p><br></p><h2>为什么使用Bootstrap?</h2><p>1、生态圈火，不断迭代更新</p><p>2、提供一套美观大方地界面组件</p><p>3、提供一套优雅的HTML＋CSS编码规范</p><p>4、让Web开发更简单，更快捷</p><p><br></p><h2>Bootstrap的基本使用</h2><h3>.container<br></h3><pre><code>container类是一个布局容器。用于固定宽度并支持响应式布局的容器，也就是常说的版心。</code></pre><h1>栅格系统</h1><pre><code>栅格系统是一套响应式、移动设备优先，随着屏幕或视口尺寸的增加，系统会自动分为最多12列的布局系统。<br></code></pre><ul><li>row必须包含在<b>.container</b>&nbsp;或 <b>.container-fluid</b> 中&nbsp;</li><li>每行最多12列，通过类名控制样式</li><li>.col-md-*,表示middle屏幕</li><li><span style="font-size: 16px;">.col-lg-*,表示large屏幕</span><br></li><li><span style="font-size: 16px;">.col-xs-*,表示最小的屏幕</span></li></ul><h1>默认样式的导航条</h1><pre><code>导航条务必使用&lt;nav&gt;元素，如果使用的是通用的&lt;div&gt;元素，务必为导航条设置role="navigation"属性，这样能够让使用辅助设备的用户明确知道这是一个导航区域。</code></pre><h1>hidden-XXX(visible-XXX) 辅助类型</h1><ul><li>hidden-sm 当浏览器为small大小时隐藏</li><li>hidden-xs 当浏览器为最小时隐藏</li><li>hidden-lg 当浏览器为large时隐藏</li><li>hidden-md 当浏览器为middle时隐藏</li></ul><h1>sr-only</h1><ul><li>screenread-only 屏幕阅读器专用，在浏览器隐藏</li></ul><h1>汉堡菜单</h1><pre><code>&lt;button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav_list" aria-expanded="false"&gt;
    &lt;span class="sr-only"&gt;切换菜单&lt;/span&gt;
    &lt;span class="icon-bar"&gt;&lt;/span&gt;
    &lt;span class="icon-bar"&gt;&lt;/span&gt;
    &lt;span class="icon-bar"&gt;&lt;/span&gt;
&lt;/button&gt;<br></code></pre><p><br></p><h2>轮播图</h2><ul><li>轮播图由JS插件carousel来实现</li></ul><pre><code class="lang-html"><span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">id=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel slide"</span> <span class="na" style="color: rgb(79, 159, 207);">data-ride=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
  <span class="c" style="color: rgb(153, 153, 153);">&lt;!-- 指示器，下面的小点 --&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;ol</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel-indicators"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;li</span> <span class="na" style="color: rgb(79, 159, 207);">data-target=</span><span class="s" style="color: rgb(212, 73, 80);">"#carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">data-slide-to=</span><span class="s" style="color: rgb(212, 73, 80);">"0"</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"active"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;&lt;/li&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;li</span> <span class="na" style="color: rgb(79, 159, 207);">data-target=</span><span class="s" style="color: rgb(212, 73, 80);">"#carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">data-slide-to=</span><span class="s" style="color: rgb(212, 73, 80);">"1"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;&lt;/li&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;li</span> <span class="na" style="color: rgb(79, 159, 207);">data-target=</span><span class="s" style="color: rgb(212, 73, 80);">"#carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">data-slide-to=</span><span class="s" style="color: rgb(212, 73, 80);">"2"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;&lt;/li&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;/ol&gt;</span>

  <span class="c" style="color: rgb(153, 153, 153);">&lt;!-- 轮播项 --&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel-inner"</span> <span class="na" style="color: rgb(79, 159, 207);">role=</span><span class="s" style="color: rgb(212, 73, 80);">"listbox"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"item active"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;img</span> <span class="na" style="color: rgb(79, 159, 207);">src=</span><span class="s" style="color: rgb(212, 73, 80);">"..."</span> <span class="na" style="color: rgb(79, 159, 207);">alt=</span><span class="s" style="color: rgb(212, 73, 80);">"..."</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;
</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;!-- 轮播图标题 --&gt;
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel-caption"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
        ...
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"item"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;img</span> <span class="na" style="color: rgb(79, 159, 207);">src=</span><span class="s" style="color: rgb(212, 73, 80);">"..."</span> <span class="na" style="color: rgb(79, 159, 207);">alt=</span><span class="s" style="color: rgb(212, 73, 80);">"..."</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;div</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"carousel-caption"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
        ...
      <span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span>
    ...
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span>

  <span class="c" style="color: rgb(153, 153, 153);">&lt;!-- 左右切换的箭头 --&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;a</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"left carousel-control"</span> <span class="na" style="color: rgb(79, 159, 207);">href=</span><span class="s" style="color: rgb(212, 73, 80);">"#carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">role=</span><span class="s" style="color: rgb(212, 73, 80);">"button"</span> <span class="na" style="color: rgb(79, 159, 207);">data-slide=</span><span class="s" style="color: rgb(212, 73, 80);">"prev"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;span</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"glyphicon glyphicon-chevron-left"</span> <span class="na" style="color: rgb(79, 159, 207);">aria-hidden=</span><span class="s" style="color: rgb(212, 73, 80);">"true"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;&lt;/span&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;span</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"sr-only"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>Previous<span class="nt" style="color: rgb(47, 111, 159);">&lt;/span&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;/a&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;a</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"right carousel-control"</span> <span class="na" style="color: rgb(79, 159, 207);">href=</span><span class="s" style="color: rgb(212, 73, 80);">"#carousel-example-generic"</span> <span class="na" style="color: rgb(79, 159, 207);">role=</span><span class="s" style="color: rgb(212, 73, 80);">"button"</span> <span class="na" style="color: rgb(79, 159, 207);">data-slide=</span><span class="s" style="color: rgb(212, 73, 80);">"next"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;span</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"glyphicon glyphicon-chevron-right"</span> <span class="na" style="color: rgb(79, 159, 207);">aria-hidden=</span><span class="s" style="color: rgb(212, 73, 80);">"true"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;&lt;/span&gt;</span>
    <span class="nt" style="color: rgb(47, 111, 159);">&lt;span</span> <span class="na" style="color: rgb(79, 159, 207);">class=</span><span class="s" style="color: rgb(212, 73, 80);">"sr-only"</span><span class="nt" style="color: rgb(47, 111, 159);">&gt;</span>Next<span class="nt" style="color: rgb(47, 111, 159);">&lt;/span&gt;</span>
  <span class="nt" style="color: rgb(47, 111, 159);">&lt;/a&gt;</span>
<span class="nt" style="color: rgb(47, 111, 159);">&lt;/div&gt;</span></code></pre>','','2017-06-14 14:16:18.863817','2017-06-16 13:54:33.284552');
INSERT INTO "articles" VALUES(5,'Python基础教程(一)','','<h2>变量的定义</h2><pre><code>score = 100</code></pre><h2>变量的类型</h2><p>Python语言时一门弱类型的语言，不需要声明变量类型，只需要直接赋值就可以了，Python里面变量类型有以下几种：</p><pre><code>├─ 变量类型··················· 
└─┬─ Numbers ······················· int,long,float,complex
&nbsp; ├─ Bool ·························· True,False
&nbsp; ├─ String ························ 字符串
&nbsp; ├─ List ·························· 列表
&nbsp; ├─ Tuple ························· 元组
&nbsp; ├─ Dictionary ···················· 字典

a = 10
变量类型判断方法:type(a) =&gt; int
<br></code></pre><h2>类型转换</h2><pre><code>age = ''10''
age_num = int(age)#转换为int类型
str() # =&gt; 将变量转换为字符串类型</code></pre><h2>判断语句</h2><pre><code class="lang-python">age = 19
if age &gt; 18:
&nbsp;&nbsp;&nbsp;&nbsp;print("已成年")
else:
&nbsp;&nbsp;&nbsp;&nbsp;print("未成年")</code></pre><ul><li>逻辑判断语句</li></ul><pre><code>a = 18

if a &gt; 18 and a == 18:
&nbsp;&nbsp;&nbsp;&nbsp;print("已成年")

if a &lt; 18 or a != 18:
&nbsp;&nbsp;&nbsp;&nbsp;print("未成年")

if not (a &gt; 18 and a == 18):
&nbsp;&nbsp;&nbsp;&nbsp;print ("未成年")<br></code></pre><h2>循环语句</h2><pre><code>num = 1

while num &lt;= 10:
&nbsp;&nbsp;&nbsp;&nbsp;print(num)
&nbsp;&nbsp;&nbsp;&nbsp;num = num + 1
&nbsp;&nbsp;&nbsp;
</code></pre>','','2017-06-17 14:42:58.892609','2017-06-18 04:48:27.636730');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar, "remember_token" varchar);
INSERT INTO "users" VALUES(1,'Scott','363918226@qq.com','2017-05-15 13:39:16.618842','2017-06-15 13:45:46.973626','$2a$10$/38cqJ.l0UTqPfoWRdFo5ulgrrEVetS3rohBi64GDTFqtl2xl7xbq','cb6d1c9c7194305949854cb3d55cec5543024f29');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',1);
INSERT INTO "sqlite_sequence" VALUES('articles',5);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_remember_token" ON "users" ("remember_token");
COMMIT;
