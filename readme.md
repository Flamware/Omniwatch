# 🛰️ OmniWatch

**OmniWatch** est une plateforme industrielle de monitoring de flotte IoT. Ce projet a été conçu pour démontrer une maîtrise complète du cycle de vie logiciel : du provisionnement de l'infrastructure (IaC) à l'observabilité en production.

## 🚀 Vision du Projet
L'objectif est de transformer des messages MQTT bruts en insights business exploitables, tout en garantissant une infrastructure scalable, sécurisée et automatisée.

## 🛠 Stack Technique
* **Infra:** Terraform, GCP (GKE, VPC, Cloud SQL).
* **Back:** Go (ingestion haute performance).
* **Front:** React (Dashboard temps réel).
* **Ops:** GitHub Actions, Docker, Prometheus, Grafana.

## 🧠 Le Serment "No-AI Code"
Dans un monde saturé par le code généré, **OmniWatch est certifié 100% rédigé manuellement**.
* Chaque ligne de code a été écrite après lecture de la documentation officielle.
* L'IA a été utilisée uniquement comme "tuteur conceptuel".
* L'objectif : garantir une expertise technique profonde et une capacité de debug totale.

## 🏗 Structure du Dépôt
- `/infra` : Code Terraform (Modules & Environnements).
- `/services` : Micro-services (Go backend, React frontend).
- `/k8s` : Manifests Kubernetes & Config Helm.
- `.github/workflows` : Pipelines CI/CD.

## 📈 Roadmap
- [X] Phase 1 : Provisioning VPC & GKE avec Terraform.
- [ ] Phase 2 : Backend Go (MQTT Client + API).
- [ ] Phase 3 : CI/CD Pipeline & Dockerization.
- [ ] Phase 4 : Dashboard React & Observabilité.