using ClinicAPI.BLL;
using ClinicAPI.BLL.Interface;
using ClinicAPI.DAL;
using ClinicAPI.DAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClinicAPI
{
	public static class DependencyResolver
	{
		private static IClinicDataManager _clinicDataManager;
		private static IClinicLogicManager _clinicLogicManager;

		public static IClinicDataManager ClinicDataManager
		{
			get
			{
				if (_clinicDataManager == null)
				{
					_clinicDataManager = new ClinicBaseDataManager();
				}
				return _clinicDataManager;
			}
		}
		public static IClinicLogicManager CliniLogicManager
		{
			get
			{
				if (_clinicLogicManager == null)
				{
					_clinicLogicManager = new ClinicBaseLogicManager();
				}
				return _clinicLogicManager;
			}
		}
	}
}
