
class intel-proxy::redhat {
	file { "/etc/profile.d/intel-proxy.sh":
		ensure	=> file,
		mode   	=> "0755",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/intel-proxy.sh",
	}
	file { "/etc/profile.d/intel-proxy.csh":
		ensure	=> file,
		mode   	=> "0755",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/intel-proxy.csh",
	}

    file_line { 'yum_proxy':
        path => '/etc/yum.conf',
        line => 'proxy=http://proxy-us.intel.com:911',
    }
    file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => 'Defaults        env_keep += "http_proxy https_proxy ftp_proxy no_proxy socks_proxy"',
    }
    file {
	"gitconfig":
		ensure	=> file,
		path 	=> '/etc/gitconfig',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/gitconfig";
	}
    file {
	"sshconfig":
		ensure	=> file,
		path 	=> '/home/vagrant/.ssh/config',
		mode   	=> "0600",
		owner	=> 'vagrant',
		group	=> 'vagrant',
		source	=> "puppet:///modules/intel-proxy/sshconfig";
	}
}

