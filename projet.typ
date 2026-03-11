#set text(font: "Linux Libertine", size: 11pt)
#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))

#align(center)[
  #block(text(weight: "bold", size: 24pt)[Projet OmniWatch])
  #v(0.5em)
  #text(size: 14pt, style: "italic")[Plateforme Cloud-Native de Monitoring IoT]
  #v(1em)
  #text(weight: "bold")[Auteur :] [Ton Prénom Nom] \
  #text(weight: "bold")[Date :] #datetime.today().display()
]

#v(2em)

= 1. Introduction
Ce document définit les spécifications du projet *OmniWatch*. L'objectif est de concevoir une infrastructure complète capable d'ingérer des flux de données MQTT, de les traiter via un backend en Go, et de les visualiser sur un dashboard React, le tout orchestré par Terraform sur Google Cloud Platform (GCP).

= 2. Objectifs Techniques
- *Infrastructure as Code (IaC) :* Déploiement automatisé via Terraform.
- *Observabilité :* Monitoring via Prometheus et Grafana.
- *CI/CD :* Pipeline automatisé avec GitHub Actions.
- *Performance :* Backend Go optimisé pour la concurrence.

= 3. Stack Technique
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  [*Composant*], [*Technologie*],
  [Infrastructure], [Terraform (GCP, GKE, Cloud SQL)],
  [Backend], [Go (Golang) + Paho MQTT],
  [Frontend], [React + Tailwind + Tremor],
  [Observabilité], [Prometheus & Grafana],
  [Conteneurisation], [Docker & Kubernetes],
)

= 4. Engagement "No-AI Code"
Le code source de ce projet est rédigé manuellement. L'usage de l'IA est restreint à la compréhension des concepts théoriques et à l'explication de la documentation officielle. Aucune fonction n'est issue d'un copier-coller d'agent conversationnel afin de garantir une maîtrise totale lors des entretiens techniques.

= 5. Architecture Logicielle
L'application suit une architecture micro-services en monorepo, facilitant la cohérence entre le provisionnement de l'infrastructure et le déploiement applicatif.