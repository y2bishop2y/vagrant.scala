# -*- mode: ruby -*-
# vi: set ft=ruby :


#=============================
#-----------------------------
HOSTNAME_SCALA="scala.ec2.internal"
SCALA_NAME="scala"


# currentTime=time.inspect

#=============================
#-----------------------------
Vagrant.configure("2") do |config|

  # config.vm.box = "lucid64"		 		 


  #=============================
  # NODE: Scala
  #-----------------------------
  config.vm.define "scala" do |scala|
    
    #=============================
    # Provider: VirtualBox
    #-----------------------------
    scala.vm.provider :virtualbox do |vb, override|

      # vb.hostmanager.manage_host       = false
      # vb.hostmanager.interface         = ENV['GUEST_INTERFACE']

      # dev.vm.network :public_network, :bridge => ENV[ 'BRIDGE_INTERFACE' ]
      vb.vm.network :hostonly, "33.33.33.10"

      #--
      override.vm.box     = "precise64"
      override.vm.box_url = "http://files.vagrantup.com/precise64.box"

#      override.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
#      override.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"


      override.vm.hostname = HOSTNAME_SCALA

#      override.ssh.max_tries = 40
#      override.ssh.timeout   = 120


      vb.customize [
                    'modifyvm', :id,
                    '--name', "#{SCALA_NAME}"
                   ]
      vb.customize ["modifyvm", :id, "--memory", 8192]
      vb.customize ["modifyvm", :id, "--cpus",   4]

      override.vm.provision :chef_solo do |chef|
        chef.json = {
        }
        
        chef.run_list = [
                         "recipe[scala::default]"
                        ]

      end

    end


    #=============================
    # Provider: AWS
    #-----------------------------
    scala.vm.provider :aws do |aws, override|


      aws.hostmanager.interface = "eth0"

      #-- Root account
      override.vm.box     = "precise64"
      override.vm.box_url = "https://ngithub.com/mitchellh/vagrant-aws/raw/master/dummy.box"
      override.vm.hostname = HOSTNAME_SCALA

      #-- Vagrant account
      aws.tags["Name"]         = "( #{ENV['USERNAME']} )"
      aws.tags["Creator"]      = "ENV[ 'USERNAME' ]"
      aws.tags["SHA"]          = "ENV[ 'SHA' ]"
      # aws.tags["CURRENT_TIME"] = currentTime

      #-- Vagrant account
      aws.instance_type     = ENV[ 'AWS_INSTANCE_TYPE' ] 
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]
      
      aws.keypair_name      = ENV[ 'AWS_KEYPAIR_NAME' ] 
        
      aws.ami               = ENV[ 'AWS_AMI' ]
      aws.region            = ENV[ 'AWS_REGION' ]
      aws.zone              = ENV[ 'AWS_ZONE' ]
      aws.security_groups   = ENV[ 'AWS_SECURITY_GROUPS' ]    
      override.ssh.username         = ENV[ 'AWS_USERNAME' ] 
      override.ssh.private_key_path = ENV[ 'AWS_KEY_PATH' ] 



    end
    


  end


end
