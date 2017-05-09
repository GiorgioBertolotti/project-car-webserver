using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fleck;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using System.Reflection;

namespace EasyTravelWSServer
{
    class Program
    {
        static void Main(string[] args)
        {
            WebSocketServer server = new WebSocketServer("wss://192.168.200.160:8001/");
            string path = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"myCert.pfx");
            server.Certificate = new X509Certificate2(path,"Crossover98!");
            List<IWebSocketConnection> sockets = new List<IWebSocketConnection>();
            List<Client> clients = new List<Client>();
            server.Start(socket =>
            {
                socket.OnOpen = () =>
                {
                    Console.WriteLine("Connection open.");
                    sockets.Add(socket);
                };
                socket.OnClose = () =>
                {
                    Console.WriteLine("Connection closed.");
                    sockets.Remove(socket);
                };
                socket.OnMessage = message =>
                {
                    Console.WriteLine(socket.ConnectionInfo.ClientIpAddress + ": " + message);
                    dynamic received = JObject.Parse(message);
                    if (received.Type != null)
                    {
                        switch ((string)received.Type) {
                            case "Pair":
                                {
                                    Client newclient = new Client() { Mobile = received.Mobile, Name = received.Name, Surname = received.Surname, Socket = socket };
                                    clients.Add(newclient);
                                    socket.Send(JsonConvert.SerializeObject(new { Type = "Result", Message = "Welcome!" }));
                                    break;
                                }
                            case "Call":
                                {
                                    Client caller = clients.Find(o => o.Mobile == (string)received.Caller);
                                    int counter = 0;
                                    foreach(Client a in clients)
                                    {
                                        if (a.Mobile == (string)received.Receiver)
                                        {
                                            a.Socket.Send(JsonConvert.SerializeObject(new { Caller = caller.Mobile, Name = caller.Name, Surname = caller.Surname, Type = "Call" }));
                                            counter++;
                                        }
                                    }
                                    if(counter==0){
                                        socket.Send(JsonConvert.SerializeObject(new { Type = "Error", Message = "L'altro client non è più connesso" }));
                                    }
                                    break;
                                }
                            case "E-Mail":
                                {
                                    Client caller = clients.Find(o => o.Mobile == (string)received.Caller);
                                    int counter = 0;
                                    foreach (Client a in clients)
                                    {
                                        if (a.Mobile == (string)received.Receiver)
                                        {
                                            a.Socket.Send(JsonConvert.SerializeObject(new { Caller = caller.Mobile, Name = caller.Name, Surname = caller.Surname, Type = "E-Mail" }));
                                            counter++;
                                        }
                                    }
                                    if (counter == 0)
                                    {
                                        socket.Send(JsonConvert.SerializeObject(new { Type = "Error", Message = "L'altro client non è più connesso" }));
                                    }
                                    break;
                                }
                        }
                    }
                };
            });
            Console.ReadLine();
            server.Dispose();
        }
    }
}
