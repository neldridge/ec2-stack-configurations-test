# Testing Full Stack build with Chef &amp; Puppet combined using EC2 free tier

* Create CentOS 7 VM
* Install Puppet via Yum
  * sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
  * sudo yum install puppetserver puppet-agent
* Install Ruby (v2.0.0 used)
* Install AWS SDK Core & Retries
  * sudo /opt/puppetlabs/bin/puppetserver gem install aws-sdk-core retries
  * sudo /opt/puppetlabs/puppet/bin/gem install aws-sdk-core retries
  * sudo puppet module install puppetlabs-aws
* Created New AWS account for Free Tier
* Created ec2-mgmt IAM Group ( https://github.com/puppetlabs/puppetlabs-aws/tree/master/examples/iam-profile/ )
* Created puppet IAM User, added to ec2-mgmt group
* Created ~/.aws/credentials
```
[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key

```
* Add proper availability zones and regions
```
aws ec2 describe-regions
aws ec2 describe-availability-zones --region us-east-1
```
