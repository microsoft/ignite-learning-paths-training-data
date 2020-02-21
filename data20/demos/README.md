# Demos instructions

The following document describe how to do all the demos presented during the session. You must have completed the [deployment](../deployment/README.md) before attempting to do the demos.

---

## Demo 1 - Ingesting Data with Azure Data Factory 

> 💡 You must have completed the [deployment](../deployment/README.md) before attempting to do the demo.
     
## Exercise 1: Ingest data using the Copy Activity
  
Estimated Time: 15 minutes

Individual exercise
  
The main tasks for this exercise are as follows:

1. Add the Copy Activity to the designer

1. Create a new HTTP dataset to use as a source

1. Create a new ADLS Gen2 dataset sink

1. Test the Copy Activity

### Task 1: Add the Copy Activity to the designer

1. Navigate to the resource group in you Azure Demo deployment, and expand Azure Data Factory.

1. In the Azure Data Factory screen, in the middle of the screen, click on the button, **Author & Monitor**

1. **Open the authoring canvas** If coming from the ADF homepage, click on the **pencil icon** on the left sidebar or the **create pipeline button** to open the authoring canvas.

1. **Create the pipeline** Click on the **+** button in the Factory Resources pane and select Pipeline

1. **Add a copy activity** In the Activities pane, open the Move and Transform accordion and drag the Copy Data activity onto the pipeline canvas.

    ![Adding the Copy Activity to Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files/M07-E02-T01-img01.png)


### Task 2: Create a new HTTP dataset to use as a source

1. In the Source tab of the Copy activity settings, click **+ New**

1. In the data store list, select the **HTTP** tile and click continue

1. In the file format list, select the **DelimitedText** format tile and click continue

1. In Set Properties blade, give your dataset an understandable name such as **HTTPSource** and click on the **Linked Service** dropdown. If you have not created your HTTP Linked Service, select **New**.

1. In the New Linked Service (HTTP) screen, specify the url of the moviesDB csv file. You can access the data with no authentication required using the following endpoint:

    https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-data/master/data20/demos/moviesDB.csv

1. Place this in the **Base URL** text box. 

1. In the **Authentication type** drop down, select **Anonymous**. and click on **Create**.


    -  Once you have created and selected the linked service, specify the rest of your dataset settings. These settings specify how and where in your connection we want to pull the data. As the url is pointed at the file already, no relative endpoint is required. As the data has a header in the first row, set **First row as header** to be true and select Import schema from **connection/store** to pull the schema from the file itself. Select **Get** as the request method. You will see the followinf screen

        ![Creating a linked service and dataset in Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files/M07-E02-T02-img01.png)
           
    - Click **OK** once completed.
   
    a. To verify your dataset is configured correctly, click **Preview Data** in the Source tab of the copy activity to get a small snapshot of your data.
   
   ![Previewing in Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files//M07-E02-T02-img02.png)

### Task 3: Create a new ADLS Gen2 dataset sink

1. Click on the **Sink tab**, and the click **+ New**

1. Select the **Azure Data Lake Storage Gen2** tile and click **Continue**.

1. Select the **DelimitedText** format tile and click **Continue**.

1. In Set Properties blade, give your dataset an understandable name such as **ADLSG2** and click on the **Linked Service** dropdown. If you have not created your ADLS Linked Service, select **New**.

1. In the New linked service (Azure Data Lake Storage Gen2) blade, select your authentication method as **Account key**, select your **Azure Subscription** and select your Storage account name of **awdlsstudxx**. You will see a screen as follows:

   ![Create a Sink in Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files//M07-E02-T03-img01.png)

1. Click on **Create**

1. Once you have configured your linked service, you enter the set properties blade. As you are writing to this dataset, you want to point the folder where you want moviesDB.csv copied to. In the example below, you are writing to the  **data** folder. While the folder can be dynamically created, the file system must exist prior to writing to it.
    * Set 'File path' to the 'data' folder in ADLS
    * Set **First row as header** to be true. 
    * Set 'Import schema' to 'From connection/store'


![Setting properties of a Sink in Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files/M07-E02-T03-img02.png)

1. Click **OK** once completed.

### Task 4: Test the Copy Activity

At this point, you have fully configured your copy activity. To test it out, click on the **Debug** button at the top of the pipeline canvas. This will start a pipeline debug run.

1. To monitor the progress of a pipeline debug run, click on the **Output** tab of the pipeline

1. To view a more detailed description of the activity output, click on the eyeglasses icon. This will open up the copy monitoring screen which provides useful metrics such as Data read/written, throughput and in-depth duration statistics.

   ![Monitoring a pipeline in Azure Data Factory in the Azure Portal](/demos/Linked_Image_Files/M07-E02-T04-img01.png)

1. To verify the copy worked as expected, open up your ADLS gen2 storage account and check to see your file was written as expected
1. **Important:** In order to proceed with the next demo - click **Publish All** to deploy the pipeline to the factory

💡 NOTE - At the end of this demo, if you are NOT going through any other demos - delete the resource group to reduce and mimize Azure spend.