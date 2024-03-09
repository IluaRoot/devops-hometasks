# IT-academy CI/CD course term project helm repository

![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

- This is a course term project 
- Repository contains a helm package and serve as a deploy tool
- On my local machine created minikube cluster to deploy helm package from this repository
- My GitHub repository have a **12-helm** directory with helm charts structure
- In argocd-files directory lay argoCD manifest to deploy helm to my minikube cluster

## How to

- For deploying with ArgoCD just execute 

```shell
kubectl create -f wcg_helm_deploy.yaml
```

or

```shell
minikube kubectl -- create -f wcg_helm_deploy.yaml
```

