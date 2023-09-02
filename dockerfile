# Use an official MongoDB image as the base image
FROM mongo:latest

# Create a directory to store your data preload scripts
RUN mkdir -p /data/preload

# Copy your data preload scripts into the container
COPY data.json /data/preload
COPY 808.wav /data/preload
COPY 808-closed-hat-1.wav /data/preload
COPY ambient.wav /data/preload
COPY open-hat.wav /data/preload
COPY snare.wav /data/preload
COPY tabla.wav /data/preload
COPY trap.wav /data/preload

# Set an environment variable to indicate that data preloading is required
ENV MONGO_INITDB_DATABASE=mydb

# Run a script to preload data into the MongoDB database
CMD ["mongoimport", "--host", "localhost", "--db", "mydb", "--collection", "mycollection", "--type", "json", "--file", "/data/preload/data.json", "--jsonArray"]
