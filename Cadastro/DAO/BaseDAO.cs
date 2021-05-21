using Cadastro.Data;
using Cadastro.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.DAO
{
    public abstract class BaseDAO<T> where T : BaseModel
    {
        protected readonly ApplicationDbContext contexto;
        protected readonly DbSet<T> dbSet;

        public BaseDAO(ApplicationDbContext contexto)
        {
            this.contexto = contexto;
            dbSet = contexto.Set<T>();
        }

    }
}
