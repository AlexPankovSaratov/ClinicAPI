using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ClinicAPI.Entity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace ClinicAPI.Controllers
{
	[Route("[controller]")]
	[ApiController]
	public class ClinicAPIController : ControllerBase
	{
		private readonly ILogger<ClinicAPIController> _logger;

		public ClinicAPIController(ILogger<ClinicAPIController> logger)
		{
			_logger = logger;
		}
		[HttpGet, Route("GetAllPatientsByClinic")]
		public IEnumerable<Patient> GetAllPatientsByClinic(string clinicName)
		{
			return DependencyResolver.CliniLogicManager.GetAllPatientsByClinic(clinicName);
		}
		[HttpPost, Route("AddPatient")]
		public bool AddPatient(Patient patient)
		{
			return DependencyResolver.CliniLogicManager.AddPatient(patient);
		}
		[HttpPost, Route("AddClinic")]
		public bool AddClinic(Clinic clinic)
		{
			return DependencyResolver.CliniLogicManager.AddClinic(clinic);
		}
	}
}
