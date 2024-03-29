FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY app/SampleWebApp/*.csproj .
RUN dotnet restore

# Copy everything else and build website
COPY app/SampleWebApp/. .
RUN dotnet publish -c release -o /WebApp --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /WebApp
COPY --from=build /WebApp ./
ENTRYPOINT ["dotnet", "SampleWebApp.dll"]
