using Cadastro.DAO.Interface;
using Cadastro.Data;
using Cadastro.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.DAO.Cadastro
{
    public class RegistroDAO : BaseDAO<Registro>, IRegistroDAO
    {
        private readonly ApplicationDbContext context;

        public RegistroDAO(ApplicationDbContext context) : base(context)
        {
            this.context = context;
        }

        public async Task<List<Registro>> GetRegistrosAsync()
        {
            var query = await context.Registro.ToListAsync();
            return query;
        }

        public async Task<int> InsertRegistro(Registro registro)
        {
            dbSet.Add(registro);
            return await context.SaveChangesAsync();
        }

    }
}
