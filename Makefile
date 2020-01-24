# @link https://wiki.jenkins.io/display/JENKINS/Jenkins+CLI
export JENKINS_URL=https://argama-dev.jenkins.ec2:8443/
export JENKINS_USER_ID=t-sasaki
export JENKINS_API_TOKEN=117957559fd217321ff9f448b9df683b66

JENKINS_CLI_OPTS=-noCertificateCheck -noKeyAuth

get-job/%:
	java -jar jenkins-cli.jar ${JENKINS_CLI_OPTS} get-job $*

create-job/%:
	env JOB_NAME=$* envsubst '$$JOB_NAME' < job.xml.template \
		| java -jar jenkins-cli.jar ${JENKINS_CLI_OPTS} create-job $*
