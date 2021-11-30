
	
----  EXERCICIO 1 //

	SELECT * FROM Funcionario

---- EXERCICIO 2 //

	SELECT NOME, CPF
	FROM Funcionario

---- EXERCICIO 3 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'F'

---- EXERCICIO 4 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Sexo = 'M'

---- EXERCICIO 5 //

	SELECT * FROM Dependente (NOLOCK) WHERE Sexo = 'M'

---- EXERCICIO 6 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE 'M%'

---- EXERCICIO 7 //

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE 'P%'

---- EXERCICIO 8 //

	SELECT * FROM Funcionario (NOLOCK) WHERE Nome LIKE '%CRUZ%'

---- EXERCICIO 9 //

	SELECT * FROM Dependente (NOLOCK) WHERE Nome LIKE '%CRUZ'

---- EXERCICIO 10 //

	select 
	Projeto.Nome,
	Min(TrabalhaProjeto.QtdeHoras)	
	from TrabalhaProjeto
	inner join Projeto on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome

---- EXERCICIO 11 //

	select 
	Projeto.Nome,
	AVG(TrabalhaProjeto.QtdeHoras)
	from TrabalhaProjeto
	inner join Projeto on Projeto.ProjetoID = TrabalhaProjeto.ProjetoID
	group by Projeto.Nome


---- EXERCICIO 12 //

	select sexo, count(FuncionarioID) as Quantidade
	from Funcionario
	group by sexo

---- EXERCICIO 13 //

	select top 2
	Nome,
	DataNascimento
	from Funcionario order by DataNascimento

---- EXERCICIO 14 //

select top 3
	Nome,
	Sexo,
	DataNascimento
From Funcionario order by DataNascimento desc

---- EXERCICIO 15 //

select 
	Dependente.DependenteID,
	Dependente.Nome [Nome Dependente],
	Funcionario.Nome [Nome Funcionario]
from Funcionario
left join Dependente on Dependente.FuncionarioID = Funcionario.FuncionarioID

---- EXERCICIO 16 //



---- EXERCICIO 17 //

	select*from Projeto
	INNER JOIN TrabalhaProjeto
	ON TrabalhaProjeto.ProjetoID = Projeto.ProjetoID
	INNER JOIN Funcionario
	ON TrabalhaProjeto.FuncionarioID = Funcionario.FuncionarioID


---- EXERCICIO 18 //

	select *from Funcionario
	left join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	where Dependente.DependenteID is null

---- EXERCICIO 19 //

	select 
	Funcionario.Nome,
	count (Dependente.DependenteID) QuantidadeDeDependentes
	from Funcionario
	inner join Dependente
	on Funcionario.FuncionarioID = Dependente.FuncionarioID
	group by Funcionario.Nome

---- EXERCICIO 20 //

	select 
	Funcionario.Nome,
	ISNULL(sum(TrabalhaProjeto.QtdeHoras), 0) HorasTrabalhadas
	from  Funcionario
	left join TrabalhaProjeto
	on Funcionario.FuncionarioID = TrabalhaProjeto.FuncionarioID
	group by Funcionario.Nome


---- EXERCICIO 25 //

		select Month(DataNascimento) Mes,
				count(FuncionarioID) QTDE
		from Funcionario
		group by Month(DataNascimento) 
		order by Mes


---- EXERCICIO 26 //

	select 
		Year(DataNascimento) Ano,
		Month(DataNascimento) Mes,
		count(FuncionarioID) QTDE
	from Funcionario
	group by Month(DataNascimento), Year(DataNascimento)
	order by Ano


---- EXERCICIO 27

	select Nome,
			DataNascimento,
			DATEDIFF(month, DataNascimento, getdate()) / 12
	FROM Funcionario


---- EXERCICIO 28 

	create view VwFuncionarios

	as 
	select Nome,
			FuncionarioID,
			DataNascimento
	from Funcionario

	select * from VwFuncionarios

