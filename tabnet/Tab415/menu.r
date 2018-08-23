### Cria menu Menus para o Modo interativo no R
 
# library(utils) ## carregado em autoexec.r
 winMenuAdd("TabWin")
 winMenuAddItem("TabWin", "Ajuda", ".Ajuda()")
 winMenuAddItem("TabWin", "Sobre", ".sobre()")
 winMenuAddItem("TabWin", "-", "")
 winMenuAddItem("TabWin", "Importar", ".Importa()")
 winMenuAddItem("TabWin", "Importar CSV", ".ImportaCSV()")
 winMenuAddItem("TabWin", "Importar TAB", ".ImportaTAB()")
 winMenuAddItem("TabWin", "Exportar Tabela", ".Exporta()")
 winMenuAddItem("TabWin", "Executar TabWin", ".ExpTab()")
 winMenuAdd("TabWin/Exibir")
 winMenuAddItem("TabWin/Exibir", "Colunas da Tabela","names(tabela)")
 winMenuAddItem("TabWin/Exibir", "Linhas da Tabela","rownames(tabela)")
 winMenuAddItem("TabWin/Exibir", "Titulo", "titulo")
 winMenuAddItem("TabWin/Exibir", "Subtitulo", "subtitulo")
 winMenuAddItem("TabWin/Exibir", "Rodape", "rodape")
 winMenuAddItem("TabWin", "-", " ")
 winMenuAddItem("TabWin", "Sobre2", ".sobre()")
 #winMenuAddItem("TabWin", "Executar TabWin", "disable")

# Funcoes auxiliares

.Ajuda <- function() { browseURL(paste(dirtabwin,"DocTabWin.htm",sep="")) }

.Exporta <- function() {write.table(tabela,"tabwin.prn",sep=",",col.names=NA)}

.ExpTab <- function() {write.table(tabela,"tabwin.tab",sep=";",col.names=NA);system(paste(dirtabwin,"tabwin32.exe ",getwd(),"/tabwin.tab",sep=""),wait=F)}

.Importa <- function() { 

	resp <- winDialog("yesno", "Quer Importar a Tabela novamente? \n o objeto tabela sera sobrescrito.")
	if(resp=="YES"){ tabela <<- read.table("tabwin.in",check.names=FALSE) }
}

.ImportaCSV <- function() { 
		resp <- winDialog("yesno", "Quer Importar arquivo CVS ? \n o objeto tabela sera sobrescrito.")
		if(resp=="YES"){nome=choose.files("*.csv");tabela <<- read.table(nome[1],sep=",",header=T,row.name=1,dec=",",check.names=F) }
}

.ImportaTAB <- function() { 
		resp <- winDialog("yesno", "Quer Importar arquivo TAB ? \n o objeto tabela sera sobrescrito.")
		if(resp=="YES"){
		  nome=choose.files("*.tab");
		  a = readLines(nome[1]);
		  n=0
		  for (i in 1:length(a)) {
		    if(substring(a[i],1,8) == "Titulo1=") {titulo <<- substring(a[i],9,100)};
		    if(substring(a[i],1,8) == "Titulo2=") {subtitulo <<- substring(a[i],9,100)};
		    if(substring(a[i],1,7) == "Rodape=") {rodape <<- substring(a[i],8,100)};
		    if(substring(a[i],1,9) == "Nomemapa=") {nomemapa <<- substring(a[i],10,100)};
		    if(substring(a[i],1,1) != "\"" ) {n=n+1};
	            if(substring(a[i],1,1) == "\"" ) break 	  
		  }
		  tabela <<- read.table(nome[1],sep=";",skip=n,header=T,row.name=1,dec=",",check.names=F)
               }
}

.sobre <- function() {cat ("\n\t Interface TabWin+R versão 3.0.2 \n\n\t BETA TESTE\n\n\t Pagina Oficial http://www.datasus.gov.br/tabwin/tabwin.htm\n\n") }
