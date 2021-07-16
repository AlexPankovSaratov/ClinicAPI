using ClinicAPI.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicAPI.DAL.Interface
{
	public interface IClinicDataManager
	{
		IEnumerable<Patient> GetAllPatientsByClinic(string clinicName);
		bool AddPatient(Patient patient);
		bool AddClinic(Clinic clinic);
		Clinic GetClinicByName (string clinicName);
	}
}
