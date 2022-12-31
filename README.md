# batch_container

## このサンプルを使ってできること

- Dockerfileとdocker-compose.ymlの定義に基づいて生成されるファイルの挙動を確認できます。
- Dockerfileでコンテナをビルドする過程で生成されるファイルの挙動を確認できます。

## このサンプルの使いかた

1. このサンプルをcloneする。
2. docker-compose build
3. docker-compose up

## 細かい説明

### docker-compose build の処理
- 以下の2タイプのディレクトリとファイルが作成される。
    - Dockerfileの処理中に作成するファイル（`dirdockerfile/created_by_dockerfile.sh`）
    - Dockerfileの処理中に作成し、docker-compose.ymlでvolume作成するファイル（`dirvol/created_by_dockerfile.sh`）
### docker-compose up の処理
- 以下の2タイプのディレクトリとファイルが作成される。
    - 元々リポジトリに含まれており、docker-compose.ymlでbindするファイル（`dirbind/org_existed_file.sh`）
    - リポジトリに含まれておらず、docker-compose.ymlで始めてbindして生成するディレクトリ（`dirbind_after/`）
- lsla.shを実行する
    - shは上記４タイプのディレクトリのファイルのリストを表示する。また、ディレクトリ内のファイルの実行を行う。

### 動作の解説
- docker-compose upすると以下が出力される。
```
batch-container    | ls -la ==================================
batch-container    | total 28
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 .
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 ..
batch-container    | drwxr-xr-x    2 1000     1000          4096 Dec 31 02:29 dirbind
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:36 dirbind_after
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:36 dirdockerfile
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:15 dirvol
batch-container    | -rw-r--r--    1 root     root           684 Dec 31 03:09 lsla.sh
batch-container    | dirbind =================================　※①元々リポジトリに含まれており、docker-compose.ymlでbindしたもの
batch-container    | total 12
batch-container    | drwxr-xr-x    2 1000     1000          4096 Dec 31 02:29 .
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 ..
batch-container    | -rw-r--r--    1 1000     1000            55 Dec 31 02:29 org_existed_file.sh
batch-container    | dirbind after =========================== ※②リポジトリに含まれておらず、docker-compose.ymlで始めてbindされたもの
batch-container    | total 8
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:36 .
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 ..
batch-container    | dirvol ================================== ※③Dockerfileの処理中に作成し、docker-compose.ymlでvolume作成したファイル
batch-container    | total 12
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:15 .
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 ..
batch-container    | -rw-r--r--    1 root     root            50 Dec 31 03:10 created_by_dockerfile.sh
batch-container    | dirdockerfile =========================== ※④Dockerfileの処理中に作成したファイル
batch-container    | total 12
batch-container    | drwxr-xr-x    2 root     root          4096 Dec 31 03:36 .
batch-container    | drwxr-xr-x    1 root     root          4096 Dec 31 03:36 ..
batch-container    | -rw-r--r--    1 root     root            57 Dec 31 03:36 created_by_dockerfile.sh
batch-container    | dirbind file ======================
batch-container    | This file existed from the beginning.
batch-container    | dirdockerfile file ======================
batch-container    | This file created by Dockerfile in dirdockerfile.
batch-container    | dirvol file ======================
batch-container    | This file created by Dockerfile in dirvol.
```
- 実行後にbatch-containerコンテナが作成される。削除は `docker-compose down`
- 実行後にbatch_container_dirvolボリュームが作成される。削除は `docker volume rm batch_container_dirvol`
- 実行後にbatch_container_batch_containerイメージが作成される。削除は `docker rmi batch_container_batch_container:latest`

## 参考資料
- [Docker におけるデータ管理](https://matsuand.github.io/docs.docker.jp.onthefly/storage/)