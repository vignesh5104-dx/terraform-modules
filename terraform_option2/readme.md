How to Deploy
🔹 Initialize
terraform -chdir=envs/dev init

🔹 Validate
terraform -chdir=envs/dev validate

🔹 Plan
terraform -chdir=envs/dev plan

🔹 Apply
terraform -chdir=envs/dev apply -auto-approve
