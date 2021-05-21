using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Carga.Lib
{
    public class FileNameComparer : IComparer<string>
    {

        /// <summary>
        /// Normatiza do nome de um arquivo
        /// </summary>
        /// <param name="fileName">Arquivo</param>
        /// <returns>Data do arquivo</returns>
        public static int GetDateFromFileName(String fileName)
        {
            //tblCliente.csv
            var regex = new Regex(@"tbl*.csv");
            var result = regex.Match(fileName);
            if (result.Success)
                return Int32.Parse(result.Groups["Date"].Value);
            return 0;
        }

        /// <summary>
        /// Comparar dois nomes de arquivo para mantê-los na ordem de importação
        /// </summary>
        /// <param name="f1">Nome de arquivo 1</param>
        /// <param name="f2">Nome de arquivo 2</param>
        /// <returns></returns>
        public int Compare(string f1, string f2)
        {
            var d1 = GetDateFromFileName(f1);
            var d2 = GetDateFromFileName(f2);

            if (d1 > d2)
                return 1;
            else if (d1 < d2)
                return -1;
            else
                return 0;
        }
    }
}
