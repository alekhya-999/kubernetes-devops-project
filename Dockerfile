FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY *.slnx .
COPY FlipkartApp.web/ FlipkartApp.web/
COPY FlipkartApp.business/ FlipkartApp.business/
COPY FlipkartApp.data/ FlipkartApp.data/
WORKDIR /src/FlipkartApp.web
RUN dotnet restore 
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
CMD ["dotnet", "FlipkartApp.web.dll"]