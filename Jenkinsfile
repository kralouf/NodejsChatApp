pipeline
{
    agent none
    stages
    {
        stage('Cloning Git')
        {
            agent
            {
                label 'ubuntu-Appserver-3120'
            }
            steps
            {
                checkout scm
            }
        }
        stage('SCA-SAST-Snyk-Test')
        {
            agent
            {
                label 'ubuntu-Appserver-3120'
            }
            steps
            {
                snykSecurity(
                snykInstallation: 'Snyk',
                snykTokenId: 'Snykid',
                severity: 'critical'
            )
            }
            
        }
        stage('Build-and-Tag')
        {
            agent
            {
                label 'ubuntu-Appserver-3120'
            }
            steps
            {
                script
                {
                    def app = docker.build("lkraimer/nodejschatapp")
                    app.tag("latest")
                }
            }
        }
        stage('Post-to-DockerHub')
        {
            agent
            {
                label 'ubuntu-Appserver-3120'
            }
            steps
            {
                script
                {
                    docker.withRegistry("https://registry.hub.docker.com", "dockerhub_credentials")
                    {
                        def app = docker.image("lkraimer/nodejschatapp")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Deployment')
        {
            agent
            {
                label 'ubuntu-Appserver-3120'
            }
            steps
            {
                sh "docker compose down"
                sh "docker-compose up -d"
            }
        }
    }
}