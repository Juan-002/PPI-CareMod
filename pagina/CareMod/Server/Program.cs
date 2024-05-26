using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Repositorio;
using System.Data;
using System.Data.SqlClient;
using CareMod.Server.Context;
using Oracle.ManagedDataAccess.Client;
using CareMod.Client.Pages;
using Dapper;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();
builder.Services.AddSingleton<IDbConnection>((sp) => new OracleConnection(builder.Configuration.GetConnectionString("CONEXIONORACLE")));
builder.Services.AddSingleton<DapperContext>();

builder.Services.AddScoped<IInsertarRepositorio, InsertarRepositorio>();
builder.Services.AddScoped<ISeleccionarRepositorio, SeleccionarRepositorio>();
builder.Services.AddScoped<IEditarRepositorio, EditarRepositorio>();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var dbConnection = services.GetRequiredService<IDbConnection>();

    try
    {
        dbConnection.Open();
        Console.WriteLine("Conexión a Oracle establecida correctamente.");

        var query = "SELECT * FROM TB_PACIENTES"; // Ajusta las columnas según tu tabla
        using (var command = new OracleCommand(query, (OracleConnection)dbConnection))
        {
            using (var reader = command.ExecuteReader())
            {
                var pacientes = dbConnection.Query<Paciente>(query);
                // Almacenar los resultados en una variable
                var listaPacientes = new List<Paciente>(pacientes);
            }
        }

        dbConnection.Close();
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Error al conectar a Oracle: {ex.Message}");
    }
}


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseBlazorFrameworkFiles();
app.UseStaticFiles();

app.UseRouting();


app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");

app.Run();
