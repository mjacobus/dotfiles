require "thor"

class DevCli < Thor

  desc "mysql_test_db", "create a test mysql database"
  option :force, type: :boolean
  option :port, type: :numeric, default: 3306
  def mysql_test_db
    from_shell('docker rm -f mysql_test') if options[:force]
    port = options[:port]

    command = [
      "docker run -p 3306:#{port}",
      "--name mysql_test",
      "-e MYSQL_ALLOW_EMPTY_PASSWORD=yes ",
      "-e MYSQL_ROOT_HOST=172.17.0.1",
      "-d mysql/mysql-server",
    ]

    from_shell!(*command)
  end

  private

  def from_shell(*command)
    system(*command.join(' ').to_s)
    $?.exitstatus
  end

  def from_shell!(*command)
    exit_status = from_shell(*command)

    unless exit_status == 0
      exit(exit_status)
    end
  end
end
