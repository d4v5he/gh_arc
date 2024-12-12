# gh_arc
sudo yum update -y
sudo yum install -y libicu


## Argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pods -n argocd

<!-- kubectl port-forward svc/argocd-server -n argocd 8080:443 -->

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d

argocd login <ARGOCD_SERVER> --username admin --password <PASSWORD>

argocd account update-password
