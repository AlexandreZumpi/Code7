using Cadastro.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.DAO.Interface
{
    public interface IRegistroDAO
    {
        Task<List<Registro>> GetRegistrosAsync();
        Task<int> InsertRegistro(Registro registro);
    }
}
