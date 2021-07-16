using ClinicAPI.BLL.Interface;
using ClinicAPI.DAL.Interface;
using ClinicAPI.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ClinicAPI.BLL
{
	public class ClinicBaseLogicManager : IClinicLogicManager
	{
		private IClinicDataManager cdm;

		public ClinicBaseLogicManager()
		{
			cdm = DependencyResolver.ClinicDataManager;
		}
		public bool AddClinic(Clinic clinic)
		{
			if (cdm.GetClinicByName(clinic.Name) != null) return false;
			return false;
			return cdm.AddClinic(clinic);
		}

		public bool AddPatient(Patient patient)
		{
			patient.City = EditingSity(patient.City);
			return cdm.AddPatient(patient);
		}

		private string EditingSity(string city)
		{
			string pattern = "г.[^\\,]+";
			var res = Regex.Match(city, pattern).Value;
			if (res.Length > 0)
			{
				res = res.Substring(2, res.Length - 2).Trim();
			}
			return res;
		}

		public IEnumerable<Patient> GetAllPatientsByClinic(string clinicName)
		{
			return cdm.GetAllPatientsByClinic(clinicName);
		}
	}
}
