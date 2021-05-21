using Cadastro.DAO.Interface;
using Cadastro.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.Controllers
{
    public class ContatoController : Controller
    {
        private IRegistroDAO registroDAO;

        public ContatoController(IRegistroDAO registroDAO)
        {
            this.registroDAO = registroDAO;
        }

        public async Task<IActionResult> Index()
        {
            //var retorno = await registroDAO.GetRegistrosAsync();
            var retorno = ((await registroDAO.GetRegistrosAsync())
                .Select(x => new Registro
                {
                    Nome = x.Nome.Split(" ").Count() > 1 ? x.Nome.Split(" ")[1] + " " + x.Nome.Split(" ")[0] : x.Nome,
                    Email = x.Email,
                    Telefone = x.Telefone,
                    Endereco = x.Endereco,
                    Cidade = x.Cidade
                })
                .OrderByDescending(x => x.Nome));

            return View(retorno.ToList<Registro>());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Registro registro)
        {
            if (ModelState.IsValid)
            {
                await registroDAO.InsertRegistro(registro);
                return RedirectToAction("Index");
            }
            return View();
        }

    }
}
