using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RBI.BUS.BUSMSSQL_CAL
{
    class BUS_UNITS
    {
        public double NpM2 = 0.00014503773773;
        public double NpCM2 = 1.4503773773;
        public double MPa = 145.03773773;
        public double bar = 145.03773773;
        public double ksi = 1000;
        public double inch = 25.4;
        public double mil = 0.0254;
        public double ft3 = 0.028316846592;
        public double FahToCel(double fah)
        {
            return (2 * fah - 32) * 5 / 9;
        }
        public double KenvinToCel(double k)
        {
            return k - 273;
        }
        public double CelToFah(double cel)
        {
            return cel * 1.8 + 32;
        }
        public double CelToKenvin(double cel)
        {
            return cel + 273;
        }
    }
}
