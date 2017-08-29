# simple

This is an Azure Resource Manager (ARM) template that installs Couchbase Enterprise.  You can run it from the  CLI or using the [Azure Portal](https://portal.azure.com).  

The template provisions a virtual network, VM Scale Sets (VMSS), Managed Disks with Premium Storage and public IPs with a DNS record per node.  It also sets up a network security group.

## Important Note

This template uses two Azure Marketplace VMs.  To deploy in your Azure subscription you must first deploy the template once from the Azure Portal [here](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/couchbase.couchbase-enterprise).

If you don't follow this step, you'll likely see an error like this:

    error:   MarketplacePurchaseEligibilityFailed : Marketplace purchase eligibilty check returned errors. See inner errors for details.

## Environment Setup

You will need an Azure account.  If using the hourly-pricing option that account must be configured for pay as you go.  If using BYOL then any account will work.

First we need to install and configure the Azure CLI.  The Azure CLI comes in both 1.0 and 2.0 versions.  For these scripts we are using the 1.0 as the 2.0 has immature logging and output.  You can install the 1.0 CLI by following the instructions [here](https://docs.microsoft.com/en-us/azure/cli-install-nodejs).

You can confirm the CLI is working properly by running:

    azure group list

Then you'll want to clone this repo.  You can do that with the command:

    git clone https://github.com/couchbase-partners/azure-resource-manager-couchbase.git
    cd azure-resource-manager-couchbase
    cd simple

## Creating a Deployment

[deploy.sh](deploy.sh) is a helper script to create a deployment.  Take a look at it, the [mainTemplateParameters.json](mainTemplateParameters.json) and modify any parameters.  Then run it as:

    ./deploy.sh <RESOURCE_GROUP_NAME>

When complete the template prints the URLs to access Couchbase Server and Couchbase Sync Gateway.

## Deleting a Deployment

To delete your deployment you can either run the command below or use the GUI in the [Azure Portal](https://portal.azure.com).

    azure group delete <RESOURCE_GROUP_NAME>
