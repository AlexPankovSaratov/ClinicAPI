using ClinicAPI.DAL.Interface;
using ClinicAPI.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicAPI.DAL
{
	public class ClinicBaseDataManager : IClinicDataManager
	{
		private SqlConnection conn;
		public bool AddClinic(Clinic clinic)
		{
			try
			{
				conn = new SqlConnection("Server=DESKTOP-S9EJ5LH\\SQLEXPRESS;DataBase=ClinicDataBase;Integrated Security=SSPI");
				conn.Open();
				SqlParameter ClinicName = new SqlParameter { ParameterName = "@Name", Value = clinic.Name };
				SqlCommand cmd = new SqlCommand("[dbo].[AddClinic]", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(ClinicName);
				var reader = cmd.ExecuteReader();
				return true;
			}
			catch (Exception ex)
			{
				return false;
			}
		}

		public bool AddPatient(Patient patient)
		{
			try
			{
				conn = new SqlConnection("Server=DESKTOP-S9EJ5LH\\SQLEXPRESS;DataBase=ClinicDataBase;Integrated Security=SSPI");
				conn.Open();
				SqlParameter PatientName = new SqlParameter { ParameterName = "@Name", Value = patient.Name };
				SqlParameter PatientCity = new SqlParameter { ParameterName = "@City", Value = patient.City };
				SqlCommand cmd = new SqlCommand("[dbo].[AddPatient]", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(PatientName);
				cmd.Parameters.Add(PatientCity);
				var reader = cmd.ExecuteReader();
				return true;
			}
			catch (Exception ex)
			{
				return false;
			}
		}

		public IEnumerable<Patient> GetAllPatientsByClinic(string clinicName)
		{
			try
			{
				conn = new SqlConnection("Server=DESKTOP-S9EJ5LH\\SQLEXPRESS;DataBase=ClinicDataBase;Integrated Security=SSPI");
				conn.Open();
				SqlParameter ClinicName = new SqlParameter { ParameterName = "@ClinicName", Value = clinicName };
				SqlCommand cmd = new SqlCommand("[dbo].[GetAllPatientsByClinic]", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(ClinicName);
				var reader = cmd.ExecuteReader();
				List<Patient> patients = new List<Patient>();
				if (reader.HasRows)
				{
					while (reader.Read())
					{
						patients.Add(new Patient { Id = (int)reader.GetInt32(0), Name = reader.GetString(1), City = reader.GetString(2)});
					}
				}
				return patients;
			}
			catch (Exception ex)
			{
				return null;
			}
		}

		public Clinic GetClinicByName(string clinicName)
		{
			try
			{
				conn = new SqlConnection("Server=DESKTOP-S9EJ5LH\\SQLEXPRESS;DataBase=ClinicDataBase;Integrated Security=SSPI");
				conn.Open();
				SqlParameter ClinicName = new SqlParameter { ParameterName = "@ClinicName", Value = clinicName };
				SqlCommand cmd = new SqlCommand("[dbo].[GetClinicByName]", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(ClinicName);
				var reader = cmd.ExecuteReader();
				List<Clinic> clinics = new List<Clinic>();
				if (reader.HasRows)
				{
					while (reader.Read())
					{
						clinics.Add(new Clinic { Id = (int)reader.GetInt32(0), Name = reader.GetString(1) });
					}
					return clinics.FirstOrDefault();
				}
				else
				{
					return null;
				}
			}
			catch (Exception ex)
			{
				return null;
			}
		}
	}
}
