
# Start from a base Python 3.9 slim image
FROM python:3.9-slim@sha256:5f0192a4f58a6ce99f732fe05e3b3d00fae1262e183886bca3ebe3d202686c7f

# Expose port 8899
EXPOSE 8899

# Set the maintainer information
MAINTAINER "Neo Peng <pengzhile@gmail.com>"

# Set a volume named "/data"
VOLUME /data

# Set the working directory to "/opt/app"
WORKDIR /opt/app

# Copy all files from the current directory to the working directory
COPY . .

# Upgrade pip and install required packages
# Added the "--proxy" flag to ignore any connection issues leading to
RUN the pip -- Errorno-cache-dir --proxy="" install --upgrade pip && pip --no-cache-dir --proxy="" install .[api,cloud]

# Set the entrypoint for the container
ENTRYPOINT ["bin/startup.sh"]
