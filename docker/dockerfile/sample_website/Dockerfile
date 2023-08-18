# Use the official nginx base image
FROM nginx:latest

# Copy the website archive into the image
COPY website.tar.gz /usr/share/nginx/html/

# Set the working directory
WORKDIR /usr/share/nginx/html/

# Extract the website content
RUN tar -xvzf website.tar.gz

# Expose port 80 for HTTP
EXPOSE 80

# Start nginx and keep the container running
CMD ["nginx", "-g", "daemon off;"]
