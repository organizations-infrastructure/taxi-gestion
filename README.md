# PROJECT_NAME Organization Infrastructure

## About
This repository describe through IAC the PROJECT_NAME administrative infrastructure that span over Github, Terraform Cloud and an AWS Organizational Unit.

## TOC

- 🪧 [About](#about)
- 🛠️ [Usage](#usage)
- 🤝 [Contribution](#contribution)
- 🏗️ [Built With](#built-with)
- 📝 [License](#license)


## Usage

### Generating the infrastructure.
Run the ['Apply the changes to GITHUB_ORGANIZATION_NAME' workflow](https://github.com/organizations-infrastructure/GITHUB_ORGANIZATION_NAME/actions) (time <~ 3 min)
- The infrastructure services; application and presentation repositories have been created and configured in the [GITHUB_ORGANIZATION_NAME github organization](https://github.com/ORGANIZATION).
- the [organization admin workspace](https://app.terraform.io/app/organizations-infrastructure/workspaces/TERRAFORM_CLOUD_ORGANIZATION_NAME) is created in terraform cloud admin infrastructure.
- the [organization](https://app.terraform.io/app/TERRAFORM_CLOUD_ORGANIZATION_NAME/workspaces) is created in terraform cloud
- an organizational unit AWS_ORGANIZATIONAL_UNIT_NAME and a deployer IAM user have been created in AWS.
- you have received an email inviting you to manage the AWS organizational unit on the management account email address.


#### Activate the Organizational Unit account
- go to the [console](https://console.aws.amazon.com/console/home) and sign-in using root user email address.
  - click 'Next' then 'Forgot password' and complete the captcha.
  - click on the reset link in your emails and setup the password in your password manager.
  - sign-in

### Domain (~30min) :
- Register a domain in [route53](https://us-east-1.console.aws.amazon.com/route53/domains/)

#### Alternatively transfer the domain from another account  (time <~ 10 min)
In the account that own the domain
  - get the OU management account id in AWS Organizations
  - go to [route53 new console](https://us-east-1.console.aws.amazon.com/route53/domains/home?region=us-east-1#/) 
    - click on the already registered domain
    - click on 'Transfer out' > 'Transfer to another AWS account' > paste the OU management account id. 
    - copy the password somewhere safe
    - signout
 
In the tenant account     
  - Accept the domain transfer in [route53 requests](https://us-east-1.console.aws.amazon.com/route53/domains/home?region=us-east-1#/ListRequests)
    - select the request with 'Action required'
    - in the Action dropdown select 'Accept'
    - paste the transfer password, accept the conditions and validate the transfer.

### Ask for a Web Distribution unlock (~5 min)
A newly created account is not verified and does not have the right to deploy a cloudfront resource.

Add to the already open limit increase request the need to verify the account. 
In [cloudfront web-distribution request limit increase](https://support.console.aws.amazon.com/support/home?region=us-east-1#/case/create?issueType=service-limit-increase):
Add the following reply :
  - Hello,
    I manage a multi-tenants AWS Organization with several OU.
    This OU management account already had an increase limit for the web distribution but the account still needs to be verified to permit the deployment of a distribution.
    Can you please verify this account ?

    More info :
    - organization root (FILL)
    - root management account (FILL)

    Error message :
    "creating CloudFront Distribution: AccessDenied: Your account must be verified before you can add new CloudFront resources. To verify your account, please contact AWS Support (https://console.aws.amazon.com/support/home#/ ) and include this error message."

    Thanks in advance,

### Deploy services in sequence (~ 60/90 min )
- Run the 'Apply changes to vpc' workflow in the new organization matching '-infrastructure' repository (time <~ 3 min)
- Once the domain has been registered / transfered run the 'Apply changes to domain' workflow in the new organization matching '-infrastructure' repository (time <~ 4-30 min)
- Run the 'Apply changes to email' workflow in the new organization matching '-infrastructure' repository (time <~ 3 min)
  - Wait to receive the "DKIM setup SUCCESS for avrtoken.com in US East (N. Virginia) region" email and run again the 'Apply changes to email' workflow (time <~ 3 min )
  - Run again the workflow a time to have the configuration_set_name in the terraform variables.  (time <~ 3 min )
- Run the 'Apply changes to identity' workflow in the new organization matching '-infrastructure' repository (time <~ 2 min)
- Run the 'Apply changes to persistence' workflow in the new organization matching '-infrastructure' repository (time <~ 11 min)
- Run the 'Apply changes to registry' workflow in the 'registry-infrastructure' repository, it end with error (time <~ 2 min)
  - Run the 'Build and release the container to ECR.' in the 'api' repository, (time <~ 2 min)
  - It should trigger the 'registry-infrastructure' again that will complete with success. (time <~ 2 min)
- Run the 'Apply changes to api' workflow in the new organization matching '-infrastructure' repository  (time <~ 4 min)

- Once the Cloudfront increase limit AND account verification requests are granted.
  - Run the 'Apply changes to client' workflow in the new organization matching '-infrastructure' repository (time <~ 10/15 min)

- (TODO Remove the need to run the admin infrastructure) Run the 'Apply the configuration' in admin infrastructure to update github action client repository variables.

- Run the "Fork Repository" workflow in the client repository (time <~ 1 min)
- Refresh, clone the repository, replace the placeholder and push to trigger the "Deploy on S3" workflow in the client repository (time <~ 2 min)

### More manual operations with the support (20 min)

At the creation of the account automatic requests increases will have been asked for:
- the number of registered domain (only needed if registering a domain within the account)
- the number of cloudfront web distribution
  - the sns monthly spending limit:


You will received one mail for each support case open.

Those requests may or may not be automatically accepted by the support.
If they are not accepted right away and ask for information here are the templates.

SNS will most probably need a month before being eligible
- Here is a received answer:
  - "Hello,
    Due to some limiting factors on your account at this time, you are not eligible to send SMS messages in US East (N. Virginia) region.
    You will need to show a pattern of use of other AWS services and a consistent paid billing history to gain access to this function.
    We enforce these limitations on all new accounts.
    Your continued usage of other AWS services will give us greater flexibility to increase your spending limits in the future.
    Please open a new case after you have a successful billing cycle and additional use of other AWS services and we will gladly review your account."
  -  You can add up to 10 verified numbers while waiting for the spending increase.

When they are accepted, thank the person and close the case.

Additional manual action to do once the matching service has been deployed
- SES (email):
  - activate the ruleset to receive emails :
    - link: https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1#/email-receiving
    - select rule set 'email_forwarding_rule_set' and click on 'Set as Active'

  - exit 'sandbox mode' to be able to send emails to non-verified addresses (mail to support) :
    - link : https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1#/account
    - example demand :
      - "PROJECT DESCRIPTION The emails sents are mostly transactional for authentication purpose though Cognito. There is no scheduled use of marketing emails yet."

  - while waiting for validation you can add verified addresses manually in SES to check the feature.

- SNS (identity):
  - exit 'sandbox mode' to be able to send SMS to non-verified phone numbers (mail to support) :
    - link :
    - template demand :
  - you may also want to increase the monthly allowed spending on SNS for verification SMS (default is 1$)

- Cognito (identity)
  - you need to exit sandbox mode in SES to be able to auto_verify emails
  - while waiting for validation you can add verified addresses manually in SES

  - you need to exit sandbox mode in SNS to be able to auto_verify phone numbers
  - while waiting for validation you can add verified addresses manually in SNS

## Switching project domain name

### Domain
- Transfer in or register the new domain

### Destroying deprecated resources
- Set ses email receiving rule as inactive in the interface (no IAC solution afaik)
- (Optional) Delete all objects in the s3 buckets 
- Destroy client and email workspaces though terraform, 
  - rerun until all resources destroyed (data loss) 
  - or keeping buckets only (no data loss)

### Deploy services in sequence (~ 60/90 min )
- Run the 'Apply changes to domain' workflow in the new organization matching '-infrastructure' repository (time <~ 4-30 min)
- Run the 'Apply changes to email' workflow in the new organization matching '-infrastructure' repository (time <~ 3 min)
  - run 3 times to setup all the variables
- Run the 'Apply changes to identity' workflow in the new organization matching '-infrastructure' repository (time <~ 3 min)
- Run the 'Apply changes to client' workflow in the new organization matching '-infrastructure' repository (time <~ 3 min)
- Run the 'Apply the configuration' in admin infrastructure to update github action client repository variables.
- Run the 'Deploy to S3' from the client

# Développement avec Terraform

## Installation

La commande suivante permet d'utiliser la ligne de commande terraform via Docker :
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

Pour une utilisation simplifiée, il est possible de créer un alias :
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Avec cet alias, il n'y a plus de différence entre une commande terraform exécutée avec Docker ou avec Terraform CLI.

## Utilisation

### Vérifier et corriger la syntaxe des fichiers `.tf`

```shell
terraform fmt
```

### Vérifier la cohérence de l'infrastructure

```shell
terraform validate
```

### Récupérer un jeton d'authentification à Terraform Cloud en local

```shell
terraform login
```

### Initialiser l'état et les plugins en local

```shell
terraform init
```

### Planifier une exécution pour voir les différences avec l'état précédent de l'infrastructure

```shell
terraform plan
```

## Contribution

### Appliquer la mise à jour de l'infrastructure

Pour que les modifications de la description de l'infrastructure soient appliquées en production, il suffit de publier les changements sur la branche `main`.

## Construit avec

### Langages & Frameworks

- [Terraform](https://www.terraform.io/) est un outil de description d'infrastructure par le code qui permet de créer et de maintenir une infrastructure de manière sûre et prévisible

### Outils

#### CI

- [Github Actions](https://docs.github.com/en/actions) est l'outil d'intégration et de déploiement continu intégré à GitHub
- Secrets du dépôt :
    - `TF_API_TOKEN` : Le token d'api Terraform Cloud qui permet à la CI d'opérer des actions sur Terraform Cloud

#### Déploiement

- [Terraform Cloud](https://app.terraform.io/) est la plateforme proposée par HashiCorp pour administrer les modifications d'infrastructure
    - Organization : [TERRAFORM_CLOUD_ORGANIZATION_NAME](https://app.terraform.io/app/TERRAFORM_CLOUD_ORGANIZATION_NAME/workspaces)

## Licence

Voir le fichier [LICENSE.md](./LICENSE.md) du dépôt.