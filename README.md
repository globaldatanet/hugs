# hugs

[HashiCorp User Groups (HUGs)](https://www.hashicorp.com/community) are a great way to meet other users and learn more about HashiCorp tools.

## Groups we manage

- **[Hamburg](https://www.meetup.com/Hamburg-HashiCorp-User-Group)**

---

## Hamburg HUG Events

- [Terraform Helpers we love at GlobalDataNet](Hamburg/21042022/) - 21-04-2022

---

## Features

Any pipeline solution we develop/offer should at least have the following:

- init
- validate
- linting
- plan
- security checks
- policy checks
- cost estimations
- apply
- notifications

## Terraform CLi/Wrappers

- Terraform
- Terragrunt
- Terraspace
- Terramate
- Cluster.dev
- GDN's Taskfile

## Custom Terraform CI/CD

- Jenkins
- Circle CI
- Gitlab CI
- Bitbucket pipelines
- Github Actions
- AWS CodeBuild and CodePipeline

## SaaS Terraform CI/CD

- env0
- Scalr
- Spacelift
- Terraform Cloud

---

## Tools

Bootstrap and prepare local developer machine, get started by **Installing** the following `DevOps` Tools:

- [Git](https://git-scm.com/)
- [Taskfile](https://taskfile.dev/#/)
- [tfenv](https://github.com/tfutils/tfenv) - tool for managing different versions of terraform; the required version can be specified directly as an argument or via `.terraform-version`
- [tgenv](https://github.com/cunymatthieu/tgenv) - tool for managing different versions of terragrunt; the required version can be specified directly as an argument or via `.terragrunt-version`
- [terraform](https://www.terraform.io/) - terraform itself, our main development tool: `tfenv install`
- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) - console utility to work with AWS API
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - conssole utility to work with Kubernetes API
- [kubectx + kubens](https://github.com/ahmetb/kubectx) - power tools for kubectl help you switch between Kubernetes clusters and namespaces
- [helm](https://helm.sh/docs/intro/install/) - tool to create application packages and deploy them into k8s
- [helmfile](https://github.com/roboll/helmfile) - "docker compose" for helm
- [terragrunt](https://terragrunt.gruntwork.io/) - small terraform wrapper providing DRY approach in some cases: `tgenv install`
- [awsudo](https://github.com/meltwater/awsudo) - simple console utility that allows running awscli commands assuming specific roles
- [aws-vault](https://github.com/99designs/aws-vault) -  tool for securely managing AWS keys and running console commands
- [aws-mfa](https://github.com/broamski/aws-mfa) - utility for automating the reception of temporary STS tockens when MFA is enabled
- [vscode](https://code.visualstudio.com/) - main IDE
- [azure-cli](https://docs.microsoft.com/en-us/cli/azure/) - Azure Command-Line Interface (CLI)

> Optionally, a pre-commit hook can be set up and configured for terraform: [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform), this will allow formatting and validating code at the commit stage

---

## AWS CLI Access

Edit AWS Config file:

```bash
vi ~/.aws/config    
```

Add AWS SSO settings:

```json
[profile XYZ]
sso_start_url=https://XYZ.awsapps.com/start
sso_region=XYZ
sso_account_id=XYZXYZXYZXYZ
sso_role_name=XYZ
```

Login using aws-vault:

```bash
aws-vault exec XYZ-shared
```

---

## VSCode

Useful DevOps VSCode extensions

### Extensions

- [editorconfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [terraform](https://marketplace.visualstudio.com/items?itemName=4ops.terraform)
- [drawio](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
- [yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [embrace](https://marketplace.visualstudio.com/items?itemName=mycelo.embrace)
- [js-beautify](https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)
- [docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [git-extension-pack](https://marketplace.visualstudio.com/items?itemName=donjayamanne.git-extension-pack)
- [githistory](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [kubernetes-tools](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- [markdown-preview-enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [file-tree-generator](https://marketplace.visualstudio.com/items?itemName=Shinotatwu-DS.file-tree-generator)
- [gotemplate-syntax](https://marketplace.visualstudio.com/items?itemName=casualjim.gotemplate)