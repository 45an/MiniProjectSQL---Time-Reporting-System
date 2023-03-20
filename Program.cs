using System.Configuration;
using Dapper;
using Npgsql;
using System.Data;
using MiniProjectSQL.DataAccess;

namespace MiniProjectSQL;
class Program
{
    static void Main(string[] args)
    {
        Menysystem();
    }

    static void Menysystem()
    {

        Console.WriteLine("Welcome to The Wealthy Inc. Time reporting system!");

        bool showMenySystem = true;

        while (showMenySystem)
        {
            Console.WriteLine("Please select an option:");
            Console.WriteLine("1. Add person");
            Console.WriteLine("2. Add project");
            Console.WriteLine("3. Register time worked on project");
            Console.WriteLine("4. Exit");
            Console.Write("===> ");

            string? input = Console.ReadLine();

            switch (input)
            {
                case "1":
                    AddPerson();
                    Console.WriteLine();
                    break;
                case "2":
                    AddProject();
                    Console.WriteLine();
                    break;
                case "3":
                    RegisterTime();
                    Console.WriteLine();
                    break;
                case "4":
                    Console.WriteLine("Exiting program...");
                    return;
                default:
                    Console.WriteLine("Invalid input. Please try again.");
                    break;
            }
        }
    }   

    static void AddPerson()
    {
            Console.WriteLine("Enter name of person:");
            string name = Console.ReadLine();

            // Call method in PostgresqlConnection class to add person to database
            PostgresqlConnection.CreateUser(name);
            Console.WriteLine($"{name} added successfully!");
    }

    static void AddProject()
    {
            Console.WriteLine("Enter name of project:");
            string addProjectName = Console.ReadLine();

            // Call method in PostgresqlConnection class to add project to database
            PostgresqlConnection.CreateProject(addProjectName);
            Console.WriteLine($"Your new projectname is {addProjectName}");
            Console.WriteLine($"{addProjectName} project added successfully!");
    }

    static void RegisterTime()
    {
            Console.WriteLine("Enter name of person:");
            string personName = Console.ReadLine();

            Console.WriteLine("Enter name of project:");
            string projectName = Console.ReadLine();

            Console.WriteLine("Enter number of hours worked:");
            int hoursWorked = int.Parse(Console.ReadLine());

            // Get the ID of the person and project from the database
            int personNames = PostgresqlConnection.GetUserIdByName(personName);
            int projectNames = PostgresqlConnection.GetProjectIdByName(projectName);

            // Call method in PostgresqlConnection class to register time worked on project
            PostgresqlConnection.TimeReport(projectNames, personNames, hoursWorked);
            Console.WriteLine($"Hi {personName}, You have been working in this project {projectName} in the last {hoursWorked} hours");
            Console.WriteLine("Time registered successfully!");
    }
    
}

