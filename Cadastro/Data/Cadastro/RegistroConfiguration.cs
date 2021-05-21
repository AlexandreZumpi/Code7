using Cadastro.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cadastro.Data.Cadastro
{
    public class RegistroConfiguration : IEntityTypeConfiguration<Registro>
    {

        public void Configure(EntityTypeBuilder<Registro> builder)
        {
            builder.ToTable("Registro");

            builder
                .Property(a => a.Id)
                .HasColumnType("int")
                .IsRequired();

            builder
                .Property(a => a.Nome)
                .HasColumnType("varchar(100)")
                .IsRequired();

            builder
                .Property(a => a.Email)
                .HasColumnType("varchar(100)")
                .IsRequired();

            builder
                .Property(a => a.Telefone)
                .HasColumnType("varchar(20)")
                .IsRequired();

            builder
                .Property(a => a.Endereco)
                .HasColumnType("varchar(200)");

            builder
                .Property(a => a.Cidade)
                .HasColumnType("varchar(100)")
                .IsRequired();

            builder.HasKey(pk => pk.Id)
                .HasName("PK_Registro");
        }

    }
}
