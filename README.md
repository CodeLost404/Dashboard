# SecurityBot

1. Install Docker
2. Clone the Git repository
3. create .env in the SecurityBot folder
4. run docker build -t securitybot . in the SecurityBot folder
5. run docker run -d --env-file .env --name securitybot -p 80:5000 securitybot

envfile=

```
DISCORD_TOKEN=token
TOPGG_TOKEN=token
TOPGG_SECRET=security404
TOPGG_WEBHOOK_ID=851816620276187156
TOPGG_WEBHOOK_TOKEN=ZgIBqOGtasPdJLvSLYQc5nQ2v7_d6MyWS93qYJKNq1vXi8UafCZCVr1ZIWb2PrbHxA8k
MONGO_URL=mongodb_url
REACT_BUILD_PATH=/app/packages/backend/frontend-build
CLIENT_ID=client_id
CLIENT_SECRET=client_secret
NODE_ENV=production
```
