using Fleck;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyTravelWSServer
{
    class Client
    {
        public string Mobile { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public IWebSocketConnection Socket { get; set; }
    }
}
