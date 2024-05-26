using CareMod.Client;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components.Authorization;
using CareMod.Client.Extensiones;
using CareMod.Client.Services;



var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

//se agrego al contenedor de dependencias el nuevo servicio
builder.Services.AddScoped<ISeleccionarDatosServicio, SeleccionarDatosServicio>();
builder.Services.AddScoped<IInsertarDatosServicio, InsertarDatosServicio>();
builder.Services.AddScoped<IEditarDatosServicio, EditarDatosServicio>();

builder.Services.AddBlazoredSessionStorage();
builder.Services.AddScoped<AuthenticationStateProvider, AutenticacionExtension>();
builder.Services.AddAuthorizationCore();


await builder.Build().RunAsync();