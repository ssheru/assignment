# Deployment of [test-app](https://github.com/bpdts/test-app)

As a part of the exercise I have opted for the first option i.e--to deploy code somewhere, then write a brief description of what you've done, and what you'd do given more time and resources. We don't care where or how you deploy it, we're interested in you demonstrating your fundamental skills.

So, this repo has the IAC code to provision infrastructure and deploy test-app developed in python.
Applications/Tools used:
- Cloud - AWS
- Infrastructure provisioning - Terraform
- Deployment Framework - Flask


## Prerequisites:
- Python3: Application dependency
- PIP: Multiple python modules dependencies
- Git: To clone Github repository
- Terraform: For provisioning  Infrastructure as a code.

## Setting up the Infrastructure:

Configuring local machine for setting IAC infrastructure.

-   Change working directory using`cd assignment/terraform`
-   `terraform init`
-  `terraform fmt`
-   `terraform validate`
-   `terraform plan `
-   `terraform apply`
## Code Deployment:

Below are the set of commands used for deploying the app.py using user data via file functions in Terraform.
- In my scenario, I have chosen to the used amazon-Linux machine for deploying the python app
      - sudo yum clean all
      - sudo yum update -y
      - sudo yum install git python36 python36-devel python36-pip -y
      - git clone https://github.com/ssheru/assignment.git
      - cd /assignment/test-app/
      - sudo pip-3.6 install -r requirements.txt
      - python3 app.py

## Deployment Brief:
I have chosen to go with a very generic deployment for this exercise, this includes--provisioning of AWS ec2 instance using terraform and while provisioning period I have installed all the required pre-requisites explained in the pre-requisite section using the user data through Terraform file function.
Once the pre-requisites were installed I have cloned the Github repo(https://github.com/ssheru/assignment) and installed all required pip modules from requirement.txt
Post installing the pip modules I have run the python script(app.py) which got deployed to the flask framework. The application was successfully accessible using  Instance public IP at port 5000.

Note:
I have forked the provided repository to my GitHub account to amend a config on app.py as the loopback address 127.0.0.1 isn't working while calling `if app.run(debug=True)` so had to modify to `include app.run(debug=True, host='0.0.0.0')`.
I had to spend some little amount of time for fixing this issue for accessing through the browser and which is the reason I went for a very Generic IAC approach.

Given more time I would have taken the following approach:

- For Infrastructure - Terraform
- Terraform modules - All the modules are in the centralized location Git (VPC, EC2...)
- Terraform State File - S3 bucket for remote state file and DynamoDB for locking
- Terraform workspaces - For multi environments and the variables for the multiple environments are controlled by *.tfvars file
- In application repository BPDTS I will have the main.tf referring to the required services from the git modules and dev.tfvars file for declaring the variables for the dev environments
- For application configuration, I will consider Harshicorp Packer to achieve image immutability
- For packer build & configuration I will leverage provisioners like Ansible or shell
- Once the new packer execution is complete the new AMI will be used by the terraform to deploy the application
- As a quick approach, the current working application is started in interactive mode whereas to start the application successfully while terraforming provisions the packer image I would need to run the flask application as service so that on boot service is started
- CI/CD flow
![enter image description here](https://github.com/ssheru/assignment/blob/master/terraform/Neproposal.png)

## Testing

- After a successful deployment, I was able to access the application at IPaddress:5000
- But the API request to the JSON file(names.json) with false information returns a status 200 which indeed should be 400.
