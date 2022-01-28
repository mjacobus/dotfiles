module Dev
  module Cli
    module Command
      class DockerMysql < Base
        def name
          'mysql_test_db'
        end

        def description
          ["mysql_test_db", "create a test mysql database"]
        end

        def options_taken
          [
            [:force, type: :boolean],
            [:port, type: :numeric, default: 3306]
          ]
        end

        def run
          application.shell_exec('docker rm -f mysql_test') if options[:force]
          port = options[:port]

          command = [
            "docker run -p 3306:#{port}",
            "--name mysql_test",
            "-e MYSQL_ALLOW_EMPTY_PASSWORD=yes ",
            "-e MYSQL_ROOT_HOST=172.17.0.1",
            "-d mysql/mysql-server",
          ]

          application.shell_exec!(*command)
        end
      end
    end
  end
end
