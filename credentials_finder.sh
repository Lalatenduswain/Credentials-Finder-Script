#!/bin/bash

# Directory to search (root directory)
search_dir="/"

# Output file
output_file="/tmp/credentials.txt"

# Patterns to search for
patterns=("db_user" "db_password" "username" "password" "user" "pass" "login" "secret" "mysql_user" "mysql_pass" "pgsql_user" "pgsql_pass" "oracle_user" "oracle_pass" 
    "credential" "auth" "auth_key" "auth_token" "access_key" "access_token" "api_key" "api_token" "jwt_token" "db_username" "db_password" "db_host" "db_hostname" "db_port" 
    "database" "db_name" "mysql_username" "mysql_password" "mysql_database" "pgsql_username" "pgsql_password" "pgsql_database" "oracle_username" "oracle_password" 
    "oracle_database" "config" "configuration" ".env" "aws_access_key_id" "aws_secret_access_key" "azure_storage_key" "gcp_service_account_key" "root" "admin"
    "certificate" "private_key" "id_rsa" "id_dsa" "ssh_key")

# Iterate over patterns
for pattern in "${patterns[@]}"; do
    # Use grep to search for the pattern in files and save to output file
    grep -r -i "$pattern" "$search_dir" >> "$output_file"
done

echo "Search complete. Potential credentials saved in $output_file"
