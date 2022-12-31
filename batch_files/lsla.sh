#!/bin/sh

echo "ls -la =================================="
ls -la

echo "dirbind ================================="
ls -la ./dirbind
echo "dirbind after ==========================="
ls -la ./dirbind_after
echo "dirvol =================================="
ls -la ./dirvol
echo "dirdockerfile ==========================="
ls -la ./dirdockerfile

echo "dirbind file ======================"
sh ./dirbind/org_existed_file.sh

echo "dirdockerfile file ======================"
sh ./dirdockerfile/created_by_dockerfile.sh

echo "dirvol file ======================"
sh ./dirvol/created_by_dockerfile.sh

# echo "dirbind file ============================"
# cat ./dirbind/created_by_dockerfile
