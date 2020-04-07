#!/usr/bin/env bash
gcloud iam service-accounts create terraform-sa \
    --description "Service Account for Terraform deployment" \
    --display-name "terraform-sa" 

mkdir ../credentials 

gcloud iam service-accounts keys create ../credentials/terraform-key.json \
  --iam-account terraform-sa@$PROJECT_ID.iam.gserviceaccount.com

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member serviceAccount:terraform-sa@$PROJECT_ID.iam.gserviceaccount.com \
  --role roles/compute.admin \
  --role roles/compute.networkAdmin \ 
  --role roles/storage.admin \
  --role roles/iam.serviceAccountUser \
  --role roles/iam.serviceAccountTokenCreator
