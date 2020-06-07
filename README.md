# Deployment of [test-app](https://github.com/bpdts/test-app)

As a part of exercise I have opted for the first option i.e--to deploy code somewhere, then write a brief description of what you've done, and what you'd do given more time and resources. We don't care where or how you deploy it, we're interested in you demonstrating your fundamental skills.

So,this repo has the IAC code to provison infrastructure and deploy test-app developed in python.
Applications/Tools used:
	- Cloud - AWS
	- Infrastructure provisioning - Terarform
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
- In my scenario i have chosen to used smszon-linux machine for deploying the python app
	- sudo apt update
	- sudo apt install git apt python3.6 python3-pip -y
	- git clone https://github.com/ssheru/assignment.git
	- cd assignment/test-app/
	- pip3 install -r requirements.txt
	- python3 app.py

## Deployment Brief:
I have chosen to go with a very generic deployment for this exercise,this includes--provisioing of AWS ec2 instance using terraform and while provisioning period I have installed all the required pre-requisites explained in the pre-requise section using the user data through Terraform file function.
Once the pre-requisites were installed I have cloned the Github repo(https://github.com/ssheru/assignment) and installed all required pip modules from requirement.txt
Post installing the pip modules I have run the python script(app.py) which got deployed to the flask framework. The application was successfully accessible using  Instance public IP at port 5000.

Note:
I have forked the provided repository to my GitHub account to amend a config on app.py as the loopback address 127.0.0.1 isn't working while calling `if app.run(debug=True)` so had to modify to `include app.run(debug=True, host='0.0.0.0')`.
I had to spend some little amount of time for fixing this issue for accessing through bbrowser and  which is the reason I went for a very Generic IAC approach.

Given a chance of more time:

- Definitely would have been implemented the same using the Terraform but the structure would have been completely different-I have gone for a terraform modularized(service modules) format and also workspace methodology.
- I would have incorporated Ansible to install and deploy the python installation and its related PIP modules and deploy the application to the Flask framework on a docker container usingg cicd(CICD approach) also have used the Harshicorp packer to bake an AMI image of the existing instances and re-spin new instances by managing versioning.
- I would have also incorporated and configured autoscaling group and load balancer in order to make the application highly available and highly redundant to listen on https, create private subnets in different AZ's and public subnets for NAT gateway. security groups would have been more braced by allowing only known traffic and ensure teh ssl connection is more secure  that the data is been encrpted using TLS1.3 protocol.

## Testing

- After a successful deployment, I was able to access the application at IPaddress:5000
- But the API request to the JSON file(names.json) with false information returns a status 200 which indeed should be 400.
