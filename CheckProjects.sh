# Script to Query All Projects in a Specified Folder and list running VMs
# Parameters: Folder ID
DEFAULTFOLDER='1234567890'
FOLDER="${1:-$DEFAULTFOLDER}"
echo $FOLDER

for projectname in $(gcloud projects list --filter parent.id=$FOLDER --format="value(PROJECT_ID)")
do
    echo VMs in Project: $projectname 
    echo ------------------------------
    gcloud compute instances list --project=$projectname --format="csv(name,zone,status)"
    echo ------------------------------
done