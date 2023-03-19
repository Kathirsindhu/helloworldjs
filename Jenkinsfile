node
{
   def buildNumber = BUILD_NUMBER
   stage("Git CheckOut"){
        git url: 'https://github.com/Kathirsindhu/helloworldjs.git',branch: 'master'
    }
   stage("Build Dokcer Image") {
         sh "docker build -t kathirsindhu/newimage:${buildNumber} ."
    }
    stage("Docker login and Push"){
       withCredentials([string(credentialsId: 'dochubpass', variable: 'dochubpass')]) {
            sh 'docker login -u kathirsindhu -p ${dochubpass}'
        }
        sh 'docker push kathirsindhu/newimage:latest'
    }
    stage("docker deploy") {
        sshagent(['dockerserver']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.14.209 sudo docker run -itd --name kkk -p 8010:3000 kathirsindhu/newimage"
        }
    }
}
