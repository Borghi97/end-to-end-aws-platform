# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
WORKDIR /src

# Copia todo o repositório (contexto ".")
COPY . .

# CORREÇÃO: Adicionado "dvn-workshop-apps/" ao caminho do projeto
RUN dotnet publish "dvn-workshop-apps/backend/YoutubeLiveApp/YoutubeLiveApp.csproj" -c Release -o /app/build

# Stage 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runner
WORKDIR /youtube-live-app

# Configurações de ambiente
ENV ASPNETCORE_ENVIRONMENT=Development
ENV URLS=http://0.0.0.0:80

# Copia os arquivos publicados
COPY --from=builder /app/build .

# O nome da DLL geralmente permanece o mesmo, a menos que definido no csproj
ENTRYPOINT ["dotnet", "YoutubeLiveApp.dll"]