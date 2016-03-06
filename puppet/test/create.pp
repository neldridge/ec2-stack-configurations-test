
Ec2_securitygroup {
  region => 'us-east-1',
}

Ec2_instance {
  region            => 'us-east-1',
  availability_zone => 'us-east-1d',
}

ec2_securitygroup { 'web-sg':
  ensure      => present,
  description => 'Security group for web servers',
  ingress     => [{
    security_group => 'lb-sg',
  },{
    protocol => 'tcp',
    port     => 22,
    cidr     => '0.0.0.0/0'
  }],
}


ec2_instance { 'web-1':
  ensure          => present,
  image_id        => 'ami-8fcee4e5', 
  security_groups => ['web-sg'],
  instance_type   => 't2.micro',
  tags            => {
    department => 'engineering',
    project    => 'cloud',
    created_by => $::id,
  }
}

