using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.Models
{
    public class Registro : BaseModel
    {
        [Display(Name ="Nome:")]
        [Required(ErrorMessage = "Campo é obrigatório")]
        public string Nome { get; set; }

        [Display(Name = "E-mail:")]
        [Required(ErrorMessage = "Campo é obrigatório")]
        [EmailAddress(ErrorMessage = "Insira um endereço de e-mail válido.")]
        public string Email { get; set; }

        [Display(Name = "Telefone"),
            DisplayFormat(DataFormatString = "{0:(##) ####-####}", ApplyFormatInEditMode = true),
            StringLength(11, MinimumLength = 11, ErrorMessage = "Telefone não pode ser maior que 11 digitos")]
        [Required(ErrorMessage = "Campo é obrigatório")]
        public String Telefone { get; set; }

        [Display(Name = "Endereço:")]
        public string Endereco { get; set; }

        [Display(Name = "Cidade:")]
        [Required(ErrorMessage = "Campo é obrigatório")]
        public string Cidade { get; set; }
    }
}
