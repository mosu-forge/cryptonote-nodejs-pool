FROM node:10-buster

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    libssl-dev \
    libboost-all-dev \
    libsodium-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy all files to the container
COPY . .

# Install npm dependencies
RUN npm install

RUN sed -i 's|"poolAddress": *".*"|"poolAddress": "your_pool_address"|' config.json

CMD ["node", "init.js"]



