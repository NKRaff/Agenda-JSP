/**
 * Confirmação de exclusão de um contato
 */

function confirmar(id){
	let resposta = confirm("Excluir contato?")
	if (resposta === true){
		//alert(id)
		window.location.href = "delete?id=" + id
	}
}