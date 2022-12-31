FROM alpine:latest

# リポジトリのbatch_filesディレクトリの内容をコピーする
WORKDIR /batch_files
COPY ./batch_files /batch_files

# 動作確認のため、ディレクトリを作成して内部にshファイルを一つ作る。
RUN mkdir ./dirdockerfile && echo "echo \"This file created by Dockerfile in dirdockerfile.\"" >> ./dirdockerfile/created_by_dockerfile.sh

# 動作確認のため、ディレクトリを作成して内部にshファイルを一つ作る。（ディレクトリは後でvolumeとして設定する）
RUN mkdir ./dirvol && echo  "echo \"This file created by Dockerfile in dirvol.\"" >> ./dirvol/created_by_dockerfile.sh

# （動作しない処理）既に/batch_files/dirbindというディレクトリが存在するので、後からファイルを追加できない。
# RUN touch ./dirbind/created_by_dockerfile
