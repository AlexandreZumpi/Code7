using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rextester
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] vetor = new int[8] { 5, 3, 2, 4, 7, 1, 0, 6 };
            int i, j, atual;
            for (i = 1; i < vetor.Length; i++)
            {
                atual = vetor[i];
                j = i;
                while ((j > 0) && (vetor[j - 1] > atual))
                {
                    vetor[j] = vetor[j - 1];
                    j = j - 1;
                }
                vetor[j] = atual;
            }
            Console.Write("RESULTADO: " + ArrayToString(vetor));
            Console.ReadKey();

        }

        private static string ArrayToString(int[] vetor)
        {
            string virgula = string.Empty;
            string valores = string.Empty;
            for (int i = 0; i < vetor.Length; i++)
            {
                valores += virgula + vetor[i];
                virgula = ",";
            }

            return valores;
        }

    }
}
