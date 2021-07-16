using ClinicAPI.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicAPI.BLL.Interface
{
	public interface IClinicLogicManager
	{
		IEnumerable<Patient> GetAllPatientsByClinic(string clinicName);
		bool AddPatient(Patient patient);
		bool AddClinic(Clinic clinic);
	}
}
