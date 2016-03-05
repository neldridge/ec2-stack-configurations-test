
Ec2_securitygroup {
  region => 'us-east-1',
}

Ec2_instance {
  region            => 'us-east-1',
  availability_zone => 'us-east-1d',
}

ec2_securitygroup { 'staging-sg':
  ensure      => present,
  description => 'Security group for staging-east',
  ingress     => [
	  {
	    protocol => 'tcp',
	    port     => 22,
	    cidr     => '0.0.0.0/0'
	  },
	  {
	    protocol => 'tcp',
	    port     => 80,
	    cidr     => '0.0.0.0/0'
	  }
  ],
}

ec2_instance { 'staging-1':
  ensure          => present,
  image_id        => 'ami-8fcee4e5', 
  security_groups => ['staging-sg'],
  instance_type   => 't2.micro',
  tags            => {
    department 	=> 'engineering',
    project    	=> 'cloud',
    environment => 'staging',
    location 	=> 'east',
    created_by 	=> $::id,
  },
  user_data		  => ''
}
