#注意项目的路径一定要写全写正确，不然配置不会成功
working_directory "/var/rails/liaoyanBlog/"
#
pid "/var/rails/liaoyanBlog/tmp/pids/unicorn.pid"
#
stderr_path "/var/rails/liaoyanBlog/log/unicornerr.log"
stdout_path "/var/rails/liaoyanBlog/log/unicornout.log"
#
##这里设置监听地址，将与Nginx配置关联
listen "/var/rails/liaoyanBlog/tmp/sockets/unicorn.sock", :backlog => 64
listen 3032, :tcp_nopush => true
#
worker_processes 2
#
preload_app true
#
timeout 30
#
before_fork do |server, worker|
#  # the following is highly recommended for Rails + "preload_app true"
#    # as there's no need for the master process to hold a connection
      defined?(ActiveRecord::Base) and
          ActiveRecord::Base.connection.disconnect!
          end
#
          after_fork do |server, worker|
#            # the following is *required* for Rails + "preload_app true"
              defined?(ActiveRecord::Base) and
                  ActiveRecord::Base.establish_connection
                  end


