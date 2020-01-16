#### 1. Install Required Software
- Git
- Docker

Both the executables for Git and Docker need to be in the PATH environment variable. This is true by default if those tools were installed using the standard windows installer.

#### 2. Clone the Git repository
- In a console enter the following:

        git clone https://github.com/schrist2/ba-demo
        cd ba-demo
        git submodule update --init --recursive
        
#### 3. Create authentication keys
- Create the following files in a directory of your choice:
  - aws_access_key_test: Contains your AWS access key for testing
  - aws_secret_key_test: Contains your AWS secret key for testing
  - aws_access_key_prod: Contains your AWS access key for production
  - aws_secret_key_prod: Contains your AWS secret key for production
  - public_key: Contains your public key
  - private_key: Contains your private key

#### 4. Running and installing Jenkins
- On a Windows machine run docker_jenkins.bat.
- On a Linux machine run docker_jenkins.sh.
- Use a browser and navigate to http://localhost:8080
- Perform a standard installation (Install suggested plugins)

#### 5. Install Jenkins TerraForm plugin
- Go to “Manage Jenkins” and then to “Manage Plugins”
- Click on the “Available”-tab and search for “terraform”
- Select the TerraForm plugin and click on “Install without restart”
- Check the box “Restart Jenkins when installation is complete and no jobs are running”
- After logging back in, browse to “Manage Jenkins” -> “Global Tool Configuration” and click on “Add Terraform. As name type “terraform”. As version, select “Terraform 0.12.19 linux (386)”
- Save
#### 6. Create Jenkins authentication keys
- On the left-hand side menu go to “Credentials”
- Click on “(global)”
- Go to “Add Credentials”
- Under “Kind” select “Secret file”
- As “File” select the respective authentication key file.
- Enter the file’s name under “ID”
- Repeat for each of the four files.
#### 7. Create job
- From the dashboard click on “Create new jobs”
- Enter “ba-demo” as item name and select “Pipeline”, then click “Ok”
- Under “General”, select “GitHub project” and enter “/var/jenkins_home/project/src/.git” as project URL
- Under “Build Triggers” check “Poll SCM” and enter “H/5 * * * *” to poll the repository every five minutes
- Under “Pipeline”, paste the script inside “jenkins-pipeline.txt”
- Save
#### 8. Wait for the build to finish
- Wait one minute.
- Under “Build History” select the latest build.
- Navigate to “Console Output”
#### 9. Check the web application
- After the build has completed successfully, navigate to the URL shown in the “web_public_dns” variable.
