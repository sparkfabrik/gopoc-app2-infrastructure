all: init generate-manifests

init:
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm repo update

generate-manifests:
	helm template --output-dir . -f values.yaml gopoc-app2 bitnami/nginx --version 8.9.0 --namespace gopoc-app2
	mv ./nginx/templates/*.yaml ./base
	rm -r nginx
