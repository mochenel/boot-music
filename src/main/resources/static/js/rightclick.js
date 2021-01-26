// delete modal 
function showModal(songId){
	let song = $(`#${songId}`).attr("name");
	$("#songName").text(song);
	$("#deleteId").attr("action","delete?val="+songId+"&nam="+song);
	$('#delete').modal("show");
 }