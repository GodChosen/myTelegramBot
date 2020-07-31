#Open command prompt

#Install the Az CLI module - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest&tabs=azure-cli

#Confirm Az installation
AZ --version

#login to Azure
Az login

#Create function directory
mkdir compound-interest
cd ~/compound-interest

#initialize the directory as a function project
func init       #choose node as runtime & javascriipt as language when prompted

#Create an HTTP-triggered function
func new --trigger HttpTrigger --name compound-interest

#Open the index.js file in a text editor
code .     #if you have vscode installed

#copy the content of my index.js file in my repository compound-interest folder

#Select all the content of the index.js file open in your editor and paste the copied content

#Run the function locally
func start

#if it run without errors, copy the URL displayed

#Open your browser and paste the URL

#append &principal=100000&rate=0.2&years=5 to the end of the URL and click enter

#Use Ctrl+C to exit in the command prompt window

#Define variables
RESOURCEGROUP=<your resource group name>      #if you have one already
STORAGEACCT=<name storage account name>
FUNCTIONAPP=<name of function app>

#Create a storage account
az storage account create \
  --resource-group "$RESOURCEGROUP" \
  --name "$STORAGEACCT" \
  --kind StorageV2 \
  --location centralus

#Create a function app
az functionapp create \
  --resource-group "$RESOURCEGROUP" \
  --name "$FUNCTIONAPP" \
  --storage-account "$STORAGEACCT" \
  --runtime node \
  --consumption-plan-location centralus

#Publish the function to Azure
func azure functionapp publish "$FUNCTIONAPP"

#To test the function, click invoke URL from the previous command output

#Append &principal=5000&rate=.035&years=36 to the end and click enter





