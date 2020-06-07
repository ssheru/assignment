       #!  bin/bash
      sudo yum clean all
      sudo yum update -y
      sudo yum install git python36 python36-devel python36-pip -y
      git clone https://github.com/ssheru/assignment.git
      cd test-app/
      pip-3.6 install -r requirements.txt
      python3 app.py


