FROM node:20

WORKDIR /app/genezio

RUN apt-get update && apt-get -y upgrade
RUN npm install -g genezio

RUN if [ -n "$GENEZIO_LOGIN_TOKEN" ]; then \
      echo "Logging in with GENEZIO_LOGIN_TOKEN..."; \
      genezio login $GENEZIO_LOGIN_TOKEN; \
    else \
      echo "GENEZIO_LOGIN_TOKEN is not set or is empty. Skipping genezio login."; \
    fi


CMD ["/bin/bash"]
