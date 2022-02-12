class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@el71.local':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQCdrY4ZZCJWAfBhcd/isGNc93VG+lY+zth68RgGDpbFcQuwTN5AWwxQ8zhudydo7Vhg4dd0eWyYxlQGh2w0DaR7T3w6md33hWR5xi+1RRyQRkxOgn1Lz9DMifO/yAf4Ze6lsplokn75B6kSSE6O1mwH8URWKRc+J2mIgShcn86jW+XhefSSfGTbJ/H0unPomb9yOEmPqIW92GLfBkTRWrHJKM7DkmUIrb5WfWgeO1TfWT4be+b/zX9Ul/55I7ytEGavMTb43DYvz5I95xi7OfhNSg9Gw4ovGwvzpiL2mdwXYP21cNISg/8OWr9qiu3ijN7zE21eu17cWOGRh5pstvFHN7LjdxLoMycMu9O//ogguEqWUbxdJAfzZ2RXL8+qyrFex4wl6V9fY0Dxa0LVHbefw/2fBSpiXUVgsj7Ms5X2UHZE9OKWwnTvRe+zEwrjhPmCieQPgf6JMfRpR+1IiYuOycLAjdRwjfKUQP5aVw+jtkyZTdtF8oIOWyrEKSOLQ6s=',
	}  
}
