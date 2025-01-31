# Step 1: Build cvtheque 1.0.4
npm run build -- --version=1.0.4
tar -czvf cvtheque-1.0.4.tar.gz dist/

# Step 2: Upload build to bucket
aws s3 cp cvtheque-1.0.4.tar.gz s3://example-bucket/cvtheque-1.0.4.tar.gz

# Step 3: Deploy by running this Ansible playbook during pipeline

ansible-playbook playbooks/example_application.yml \
    -e "application_name=cvtheque" \
    -e "application_version=1.0.4"