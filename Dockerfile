# ---------------- BUILD STAGE ----------------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

WORKDIR /src

# Copy csproj first (better caching)
COPY Pasupathikumar_Portfolio/PortfolioSite/*.csproj ./PortfolioSite/
RUN dotnet restore ./PortfolioSite/PortfolioSite.csproj

# Copy everything else
COPY Pasupathikumar_Portfolio/PortfolioSite/. ./PortfolioSite/

WORKDIR /src/PortfolioSite

# Publish app
RUN dotnet publish -c Release -o /app/publish

# ---------------- RUNTIME STAGE ----------------
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

WORKDIR /app

# Copy published output
COPY --from=build /app/publish .

# Set ASP.NET to listen on port 8080
ENV ASPNETCORE_URLS=http://+:8080

EXPOSE 8080

# Run the app
ENTRYPOINT ["dotnet", "PortfolioSite.dll"]