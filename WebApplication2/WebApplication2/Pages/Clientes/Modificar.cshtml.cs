using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Net;
using System.Text.RegularExpressions;
using WebApplication2.Pages.Clientes;


namespace WebApplication2.Pages.Clientes
{
    public class ModificarModel : PageModel
    {

        public List<String> listaTipoDocIdentidad = new List<String>();
        public List<String> listaPuesto = new List<String>();
        public List<String> listaDepartamento = new List<String>();
        public String errorMessage = "";                                    //Variable para los mensajes de error
        public String successMessage = "";
        public Empleado empleado = new Empleado();

        public void OnGet()
        {
            try
            {
                String SPNombre = "dbo.BuscarEmpleadoPorId";
                String connectionString = "Data Source=pruebajose2312.database.windows.net;Initial Catalog=prueba2312;Persist Security Info=True;User ID=adminjose;Password=Bases1234";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();                                      //Se abre la coneccion con la BD.
                    using (SqlCommand command = new SqlCommand(SPNombre, connection))
                    {
                        //Variables para obtener el DataSet mandados de la BD.
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        DataTable table = new DataTable();

                        command.CommandType = CommandType.StoredProcedure;  //Indicar que el comando sera un SP.
                        command.Parameters.AddWithValue("@inIdTipoEvento", 0);
                        command.Parameters.AddWithValue("@inIdEmpleado", int.Parse("" + Global.idUsuarioEmpleado));
                        command.Parameters.AddWithValue("@inUsuario", Global.sesion);
                        command.Parameters.AddWithValue("@inIP", Global.IP);

                        //Codigo para que detecte el output del SP.
                        SqlParameter resultCodeParam = new SqlParameter("@outResultCode", SqlDbType.Int);
                        resultCodeParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(resultCodeParam);
                        //command.ExecuteNonQuery();


                        //Porceso de obtener el DataSet.
                        adapter.SelectCommand = command;
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);

                        //Si el output de errores por DataSet es 0 (No hay problemas).
                        if (dataSet.Tables[0].Rows[0][0].ToString().Equals("0"))
                        {

                            foreach (DataRow row in dataSet.Tables[1].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                empleado.Nombre = "" + row[0];
                                empleado.TipoDocIdentidad = "" + row[1];
                                empleado.ValorDocIdentidad = "" + row[2];
                                empleado.Puesto = "" + row[3];
                                empleado.Departamento = "" + row[4];
                            }

                            foreach (DataRow row in dataSet.Tables[2].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String tipoDocIdentidad = "" + row[0];
                                listaTipoDocIdentidad.Add(tipoDocIdentidad);             //A?adir cada fila al array para su visualizacion.
                            }

                            foreach (DataRow row in dataSet.Tables[3].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String puesto = "" + row[0];
                                listaPuesto.Add(puesto);             //A?adir cada fila al array para su visualizacion.
                            }

                            foreach (DataRow row in dataSet.Tables[4].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String departamento = "" + row[0];
                                listaDepartamento.Add(departamento);             //A?adir cada fila al array para su visualizacion.
                            }

                        }
                        else
                        {
                            //En caso de que haya algun error al cargar la tabla de articulos.
                            errorMessage = "Error al cargar la lista de articulos.";
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.ToString());
            }
        }

        public void OnPost()
        {

            empleado.Nombre = Request.Form["Nombre"];
            empleado.TipoDocIdentidad = Request.Form["TipoDocIdentidad"];
            empleado.ValorDocIdentidad = Request.Form["ValorDocIdentidad"];
            empleado.Puesto = Request.Form["Puesto"];
            empleado.Departamento = Request.Form["Departamento"];

            try
            {
                String connectionString = "Data Source=pruebajose2312.database.windows.net;Initial Catalog=prueba2312;Persist Security Info=True;User ID=adminjose;Password=Bases1234";
                String spNombre = "dbo.ModificarEmpleado";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    connection.Open();

                    if (empleado.Nombre.Length == 0 || empleado.ValorDocIdentidad.Length == 0)
                    {
                        errorMessage = "Todos los datos son requeridos.";
                        return;
                    }

                    //Comprobar el formato

                    //Comprobar que el nombre solo contenga letras o guines
                    if (!VerificarFormatoNombreApellido(empleado.Nombre))
                    {
                        errorMessage = "El campo Nombre debe contener un nombre y un apellido, separados por espacio en blanco y con sin caracteres especiales";
                        errores();
                        return;
                    }
                    //Comprobar que el precio solo contenga numeros o comas
                    if (!empleado.ValorDocIdentidad.All(c => (c >= '0' && c <= '9')) || empleado.ValorDocIdentidad.Length != 9)
                    {
                        errorMessage = "El documento identidad solo debe contener 9 valores num�ricos";
                        errores();
                        return;
                    }

                    using (SqlCommand command = new SqlCommand(spNombre, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@inID", int.Parse("" + Global.idUsuarioEmpleado));
                        command.Parameters.AddWithValue("@inNombre", empleado.Nombre);
                        command.Parameters.AddWithValue("@inTipoDocIdentidad", empleado.TipoDocIdentidad);
                        command.Parameters.AddWithValue("@inValorDocIdentidad", empleado.ValorDocIdentidad);
                        command.Parameters.AddWithValue("@inPuesto", empleado.Puesto);
                        command.Parameters.AddWithValue("@inDepartamento", empleado.Departamento);
                        command.Parameters.AddWithValue("@inUsuario", Global.sesion);
                        command.Parameters.AddWithValue("@inIP", Global.IP);

                        SqlParameter resultCodeParam = new SqlParameter("@outResultCode", SqlDbType.Int);
                        resultCodeParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(resultCodeParam);

                        command.ExecuteNonQuery();

                        int resultCode = (int)command.Parameters["@outResultCode"].Value;
                        if (resultCode == 50001) //codigo generado en el SP que dice si ya un nombre del articulo existe o no
                        {
                            errorMessage = "El valor documento identidad ingresado ya existe";
                            errores();
                            return;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
            empleado.Nombre = "";
            empleado.TipoDocIdentidad = "";
            empleado.ValorDocIdentidad = "";
            empleado.Puesto = "";
            empleado.Departamento = "";
            Response.Redirect("/Exito");
        }

        static bool VerificarFormatoNombreApellido(string input)
        {
            string patron = @"^[a-zA-Z]+(?: [a-zA-Z]+)*$";

            // Utilizar la clase Regex para comprobar si el input coincide con el patr�n
            bool coincideConPatron = Regex.IsMatch(input.Trim(), patron);

            // Verificar si hay exactamente un espacio en el input
            bool tieneUnEspacio = input.Trim().Split(' ').Length == 2;

            return coincideConPatron && tieneUnEspacio;
        }

        public void errores()
        {
            try
            {
                String SPNombre = "dbo.BuscarEmpleadoPorId";
                String connectionString = "Data Source=pruebajose2312.database.windows.net;Initial Catalog=prueba2312;Persist Security Info=True;User ID=adminjose;Password=Bases1234";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();                                      //Se abre la coneccion con la BD.
                    using (SqlCommand command = new SqlCommand(SPNombre, connection))
                    {
                        //Variables para obtener el DataSet mandados de la BD.
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        DataTable table = new DataTable();

                        command.CommandType = CommandType.StoredProcedure;  //Indicar que el comando sera un SP.
                        command.Parameters.AddWithValue("@inIdEmpleado", 1);
                        command.Parameters.AddWithValue("@inUsuario", Global.sesion);
                        command.Parameters.AddWithValue("@inIP", Global.IP);

                        //Codigo para que detecte el output del SP.
                        SqlParameter resultCodeParam = new SqlParameter("@outResultCode", SqlDbType.Int);
                        resultCodeParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(resultCodeParam);
                        //command.ExecuteNonQuery();


                        //Porceso de obtener el DataSet.
                        adapter.SelectCommand = command;
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);

                        //Si el output de errores por DataSet es 0 (No hay problemas).
                        if (dataSet.Tables[0].Rows[0][0].ToString().Equals("0"))
                        {
                            foreach (DataRow row in dataSet.Tables[2].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String tipoDocIdentidad = "" + row[0];
                                listaTipoDocIdentidad.Add(tipoDocIdentidad);             //A?adir cada fila al array para su visualizacion.
                            }

                            foreach (DataRow row in dataSet.Tables[3].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String puesto = "" + row[0];
                                listaPuesto.Add(puesto);             //A?adir cada fila al array para su visualizacion.
                            }

                            foreach (DataRow row in dataSet.Tables[4].Rows) //Recorra cada fila de la tabla con los datos y estraigala en el tipo ClienteInfo.
                            {
                                String departamento = "" + row[0];
                                listaDepartamento.Add(departamento);             //A?adir cada fila al array para su visualizacion.
                            }

                        }
                        else
                        {
                            //En caso de que haya algun error al cargar la tabla de articulos.
                            errorMessage = "Error al cargar la lista de articulos.";
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.ToString());
            }
        }

    }
}