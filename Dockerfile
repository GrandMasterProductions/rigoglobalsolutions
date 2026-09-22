# Rigo Global Solutions website — served by nginx on Render
FROM nginx:alpine

# Render sends traffic to port 10000 by default
RUN printf 'server {\n  listen 10000;\n  root /usr/share/nginx/html;\n  index index.html;\n  location / { try_files $uri $uri/ /index.html; }\n  gzip on;\n  gzip_types text/html text/css application/javascript image/svg+xml;\n}\n' > /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 10000
CMD ["nginx", "-g", "daemon off;"]
