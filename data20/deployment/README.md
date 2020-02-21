# DATA20 pre-demo setup

## Prerequisites

- Microsoft Azure subscription

### Azure Subscription

Having an Azure subscription is mandatory to be able to do these demos If you don't own an Azure subscription already, you can create your **free** account today. It comes with 200$ credit, so you can experience almost everything without spending a dime.



# Deployments

## DATA20 Demo Automated Deployment

If you have NOT completed the DATA10 deployment first - please complete the [DATA10 pre-demo deployment](../../data10/deployment/README.md)

### Configure Firewall settings

1. In the Azure Portal, navigate to the SQL data warehouse blade 
1. Click **Resume** to resume the SQL data warehouse service
1. In the Azure Portal, in your **Azure Synapse Data Warehouse- Firewalls and virtual networks**
1. Click **Add Client IP** to get access to the server
1. Click **Save**

### Create a Master Key
1. Click **Query Editor (preview)**
1. Log in with the user credential you provided in the initial deployment.
1. Click **+New Query**
1. Type and execute the following syntax


    ```SQL
    CREATE MASTER KEY;
    ```






