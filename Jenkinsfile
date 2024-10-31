node('ubuntu-Appserver-3120')
{
    def app
    stage('Cloning Git')
    {
        /* Lets make sure we have the repo cloned to our workspace */
        checkout scm
    }
    stage('SCA-SAST-NODEJS-CHAT-APP-TESTING') 
    {
        snykSecurity(
            snykInstallation: 'Snyk',
            snykTokenId: 'Snykid',
            severity: 'critical'
        )
    }
    stage('Build-and-Tag')
    {
        /* Builds the actual image; synchronous to docker build on the CLI */
        app = docker.build('lkraimer/nodejschatapp')
    }
    stage('Post-to-DockerHub')
    {
        /* Pushes to DockerHub! */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials')
        {
            app.push('latest')
        }
    }
    stage('Deploy')
    {
        sh "docker compose down"
        sh "docker-compose up -d"
    }
}