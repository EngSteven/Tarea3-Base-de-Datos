using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2.Pages.Clientes
{
    public class CABorrarModel : PageModel
    {
        public ArticuloInfo articuloInfo = new ArticuloInfo();
        public String errorMessage = "";
        public String successMessage = "";

        public void OnPost()
        {
            articuloInfo.Codigo = Request.Form["Codigo"];

            if (articuloInfo.Codigo.Length == 0)
            {
                errorMessage = "Todos los datos son requeridos.";
                return;
            }


            try
            {
                String connectionString = "Data Source=project0-server.database.windows.net;Initial Catalog=project0-database;Persist Security Info=True;User ID=stevensql;Password=Killua36911-";
                string spName = "dbo.ValidarCodigoArticulo";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(spName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@inCodigo", articuloInfo.Codigo);
                        command.Parameters.AddWithValue("@inTipoAccion", '2');
                        command.Parameters.AddWithValue("@inUsuario", Global.sesion);
                        command.Parameters.AddWithValue("@inIP", Global.IP);
                        SqlParameter resultCodeParam = new SqlParameter("@outResultCode", SqlDbType.Int);
                        resultCodeParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(resultCodeParam);

                        command.ExecuteNonQuery();

                        int resultCode = (int)command.Parameters["@outResultCode"].Value;

                        if (resultCode == 50001) //codigo generado en el SP que dice si ya un nombre del articulo existe o no
                        {
                            errorMessage = "El codigo del articulo no existe";
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
            //successMessage = "Nuevo articulo a�adido correctamente.";
            TempData["CodigoIngresado"] = articuloInfo.Codigo;
            Response.Redirect("/Clientes/Borrar");

        }
    }
}