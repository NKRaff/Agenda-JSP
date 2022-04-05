
function validar(){
    let nome = form-contato.nome.value
	let fone = form-contato.fone.value
	
	if(nome === ""){
		alert('Preencha o campo Nome')
		form-contato.nome.focus()
		return false
	}else if(fone === ""){
		alert('Preencha o campo Telefone')
		form-contato.fone.focus()
		return false
	}else{
		document.forms["form-contato"].submit()
	}
}