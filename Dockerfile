# =============================================
# Visit KL — Dockerfile
# Multi-stage: build + production NGINX
# =============================================

# Stage 1: Build (copy static files)
FROM alpine:3.19 AS builder
WORKDIR /build
COPY src/ .

# Stage 2: Production NGINX
FROM nginx:1.25-alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our NGINX config
COPY nginx/nginx.conf /etc/nginx/conf.d/visit-kl.conf

# Copy static files from builder
COPY --from=builder /build /usr/share/nginx/html

# Non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup \
    && chown -R appuser:appgroup /usr/share/nginx/html \
    && chown -R appuser:appgroup /var/cache/nginx

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
