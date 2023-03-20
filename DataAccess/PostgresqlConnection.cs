using System;
using System.Configuration;
using Dapper;
using Npgsql;
using System.Data;
using MiniProjectSQL.Models;

namespace MiniProjectSQL.DataAccess
{
    class PostgresqlConnection
    {

        public static List<UserModel> LoadInUsers()
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                var output = cnn.Query<UserModel>("SELECT * FROM mus_person", new DynamicParameters());
                return output.ToList();
            }
        }


        public static List<ProjectModel> LoadInProjects()
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                var output = cnn.Query<ProjectModel>("SELECT * FROM mus_project", new DynamicParameters());
                return output.ToList();
            }
        }

        public static List<ProjectPersonModel> LoadInProjectUsers()
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                var output = cnn.Query<ProjectPersonModel>($"SELECT * FROM mus_project_person", new DynamicParameters());
                return output.ToList();
            }
        }

        public static int GetUserIdByName(string name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                var output = cnn.QueryFirstOrDefault<int>($"SELECT id FROM mus_person WHERE person_name='{name}'", new DynamicParameters());
                return output;
            }
        }

        public static int GetProjectIdByName(string name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                var output = cnn.QueryFirstOrDefault<int>($"SELECT id FROM mus_project WHERE project_name='{name}'", new DynamicParameters());
                return output;
            }
        }

        public static void CreateUser(string person_name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Execute($@"INSERT INTO mus_person (person_name) VALUES('{person_name}')", new DynamicParameters());
            }
        }

        public static void UpdateUser(int old_name, string new_name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Execute($@"UPDATE mus_person SET person_name ='{new_name}' WHERE id ={old_name}", new DynamicParameters());
            }
        }

        public static void CreateProject(string project_name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Execute($@"INSERT INTO mus_project (project_name) VALUES('{project_name}')", new DynamicParameters());
            }
        }

        public static void UpdateProject(int old_name, string new_name)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Execute($@"UPDATE mus_project SET project_name ='{new_name}' WHERE id ={old_name}", new DynamicParameters());
            }
        }

        public static void TimeReport(int projectId, int personId, int hoursWorked)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Execute($@"INSERT INTO mus_project_person (project_id,person_id,hours) VALUES({projectId},{personId},{hoursWorked})", new DynamicParameters());

            }
        }



        public static void UpdateProjectPerson(int day, int hours)
        {
            using (IDbConnection cnn = new NpgsqlConnection(LoadConnectionString()))
            {
                cnn.Query($"UPDATE mus_project_person SET hours='{hours}' WHERE id='{day}'", new DynamicParameters());
            }
        }

        private static string LoadConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }

}

