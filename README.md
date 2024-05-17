# Structure

```yaml
├── README.md
├── argocd # holds the ArgoCD definitions for apps to be deployed
│   ├── app-of-apps.yaml # root ArgoCD app
│   ├── apps # contains all apps deployed via ArgoCD
│   │   ├── customer_appset.yaml # deploys customer apps
│   │   ├── tekton_app.yaml # app that deploys tekton pipelines and tasks
│   │   └── swica # contains all apps owned by Swica
│   │       ├── swica_appset.yaml # app that deploys everything from customer Swica
│   │       └── prod # one of potentially many stages owned by Swica
│   │           ├── swica_prod_appset.yaml # app deploying all products in Swica's prod env
│   │           └── user-service # one of potentially many products in Swica's prod env
│   │               ├── user_service_appset.yaml # app deploying all components of Swica's prod user-service
│   │               └── backend-component # one of potentially many components of Swica's prod user-service
│   │                   ├── helm_app.yaml  # app deploying Swica's prod user-service backend component
│   │                   └── hook # contains hooks to be triggered after syncing the component in the parent folder
│   │                       └── post_hook.yaml # one of potentially many hooks to be triggered
│   └── projects # contains ArogCD Projects to separate customers on the platform
│       └── swica-prod.yaml # one example of a ArgoCD Project, in this case Swica prod
├── helm # a dummy Helm chart to be deployed by ArgoCD. NOTE: In the real setup, this would be in in a repository under the Devs' control
│   └── user-service
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates
│           ├── _helpers.tpl
│           ├── deployment.yaml
│           ├── service.yaml
│           └── tests
│               └── test-connection.yaml
├── tekton # contains Tekton Pipelines and Tasks. NOTE: In the real setup, this would be its own repository
│   ├── cmds.txt
│   ├── eventlistener.yaml
│   ├── goodbye_task.yaml
│   ├── hello_task.yaml
│   ├── pipeline.yaml
│   ├── pipeline_run.yaml_
│   ├── rbac.yaml
│   ├── trigger_binding.yaml
│   └── trigger_template.yaml
└── values # Contains Helm values to be shared across Helm deployments
    └── swica_values.yaml # Values to be shared across all Swica deployments, e.g. customer identifier
```