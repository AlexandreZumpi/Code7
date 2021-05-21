
---  Resposta da questão 3.1
Select 
  a.DescCliente, b.DescSexo
from 
  tblCliente a
inner join
  tblSexo b
on
  b.CodSexo = a.CodSexo



---  Resposta da questão 3.2
Select 
  a.DescCliente, a.Fone, (Select SUM(b.QtdPedidos) from tblPedido b where b.CodCliente = a.CodCliente) as QuantPedidos
from 
  tblCliente a
where
  len(a.Fone) = 9


---  Resposta da questão 3.3
Select 
  b.DescPais, AVG(c.QtdPedidos) as MediaPedidos
from
  tblCliente a
inner join
  tblPais b
on
  b.CodPais = a.CodPais
inner join
  tblPedido c
on
  c.CodCliente = a.CodCliente


--- Resposta da questão 3.4
Select 
  b.DescPais, d.DescSexo , sum(c.QtdPedidos) as MediaPedidos
from
  tblCliente a
inner join
  tblPais b
on
  b.CodPais = a.CodPais
inner join
  tblPedido c
on
  c.CodCliente = a.CodCliente
Inner join
  tblSexo d
on
  d.CodSexo = a.CodSexo
group by 
  b.DescPais, d.DescSexo
order by 
  b.DescPais, d.DescSexo

