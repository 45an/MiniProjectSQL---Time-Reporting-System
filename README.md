# MiniProjectSQL---Time-Reporting-System

This is a simple console application that allows users to add persons, projects and register time worked on a specific project by a specific person to PostgreSQL database.

## 🛠️ Tools

    C# programming language
    
    .NET Framework
    
    Dapper - Object-relational mapper (ORM) for .NET
    
    Npgsql - .NET Data Provider for PostgreSQL
    
    PostgreSQL Database

## 📑 Requierments

    Visual Studio or any other C# compiler
    
    PostgreSQL database installed on your local machine

## ⚙️ Installation

    Clone the repository or download the repository
    
    Open the solution in Visual Studio
    
    Make sure the database connection string in the app.config file is pointing to your local or remote PostgreSQL database.
    
    Build and run the application.

## 💻 Code Structure

    Program.cs - Main entry point of the application. Contains the main menu system and functions for adding persons,
    projects and registering time worked.
    
    PostgresqlConnection.cs - A static class that handles all the database interaction using Dapper and Npgsql. 
    
    Contains methods for creating a user, creating a project, getting a user by name,
    getting a project by name, and registering time worked on a project by a person.
    
    Models - A folder containing the entity models used in the application. 
    Includes UserModel.cs, ProjectModel.cs, and ProjectPersonModel.cs.
    
    Data - A folder containing the database structure.

