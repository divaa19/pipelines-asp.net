FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /WebApp
COPY $(Build.ArtifactStagingDirectory)/web ./
ENTRYPOINT ["dotnet", "SampleWebApp.dll"]
