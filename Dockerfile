# Dockerfile

# 公式の n8n Docker イメージをベースとして使用
# 安定版の latest タグを使用するか、特定のバージョン（例: 1.34.0）を指定することを推奨します
FROM n8nio/n8n:latest

# Dockerイメージがビルドされるユーザーと作業ディレクトリを設定
# 公式イメージが既に 'node' ユーザーと '/home/node' を使用しているため、それに従います
USER node
WORKDIR /home/node/n8n

# 必要に応じて、追加の Node.js パッケージをインストール
# 例: 特定のノードで必要となる外部ライブラリなど
# RUN npm install -g your-package-name

# アプリケーションのコードや設定ファイルなどをコンテナ内にコピーする場合
# n8nのカスタムノードや設定ファイルを独自のディレクトリに配置する場合に有用
# COPY ./custom-nodes /home/node/.n8n/custom/nodes
# COPY ./config/n8n_config.json /home/node/.n8n/config

# 環境変数を設定（任意）：
# これは、n8nの動作設定をDockerfileに直接埋め込む場合に使用します。
# ほとんどの場合、docker-compose.yml や docker run コマンドの -e オプションで設定することが推奨されますが、
# 環境に依存しない共通の設定であればここに記述することも可能です。
# ENV N8N_HOST=0.0.0.0
# ENV N8N_PORT=5678
# ENV N8N_PROTOCOL=http

# コンテナがリッスンするポートを公開
# n8nのデフォルトポートは5678です
EXPOSE 5678