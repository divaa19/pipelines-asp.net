FROM mcr.microsoft.com/dotnet/sdk:5.0 
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY app/SampleWebApp/*.csproj .
RUN dotnet restore

# Copy everything else and build website
COPY SampleWebApp/. .
RUN dotnet publish -c release -o /Web --no-restore
WORKDIR /WebApp
COPY /Web ./
ENTRYPOINT ["dotnet", "SampleWebApp.dll"]
