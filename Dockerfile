# Stage 1: Build the Next.js app
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json / yarn.lock
COPY package*.json ./
# If using Yarn, use: COPY yarn.lock ./

# Install dependencies
RUN npm install
# If using Yarn: RUN yarn install --frozen-lockfile

# Copy the rest of the app
COPY . .

# Build the Next.js app
RUN npm run build
# If using Yarn: RUN yarn build

# Stage 2: Production image
FROM node:20-alpine AS runner

WORKDIR /app

# Copy package.json and production dependencies
COPY package*.json ./
RUN npm install --production
# If using Yarn: RUN yarn install --production --frozen-lockfile

# Copy built Next.js files from builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.mjs ./

# Expose the default Next.js port
EXPOSE 3000

# Start the Next.js app
CMD ["npx", "next", "start"]
