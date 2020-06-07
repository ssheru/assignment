     #!  bin/bash
      sudo su -
      yum clean all
      yum update -y
      yum install git python36 python36-devel python36-pip -y
      git clone https://github.com/ssheru/assignment.git
      cd assignment/test-app/
      pip-3.6 install -r requirements.txt
      python3 app.py

###***Jenkins Installation***###
     sudo yum install java-1.8.0-openjdk-devel.x86_64yum imstall -y
     curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
     rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
     yum install jenkins -y
     service jenkins start #systemctl start jenkins
     checkconfig jenkins on #systemctl enable jenkins

###***Packer Installation***###
     wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip
     unzip -d /usr/local/bin packer_1.5.6_linux_amd64.zip




