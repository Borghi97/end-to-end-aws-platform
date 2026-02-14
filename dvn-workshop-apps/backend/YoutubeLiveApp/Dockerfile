# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
WORKDIR /src

# Copy the entire repository so that project references are maintained
COPY . .

# Fix: Reference the project using the correct relative path
RUN dotnet publish "backend/YoutubeLiveApp/YoutubeLiveApp.csproj" -c Release -o /app/build

# Stage 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runner
WORKDIR /youtube-live-app

# Fixed ENV syntax to avoid warnings
ENV ASPNETCORE_ENVIRONMENT=Development
ENV URLS=http://0.0.0.0:80

# Copy the published output from the builder stage
COPY --from=builder /app/build .

# Make sure this matches your actual compiled DLL name
ENTRYPOINT ["dotnet", "YoutubeLiveApp.dll"]