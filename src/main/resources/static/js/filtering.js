
var badwords = ["실패", "탈락", "엿", "빠큐", "ㅅㅂ", "불행", "멸망","살인","폭행","복수","혐오","경멸",];
function filter(word){
	console.log(word);
	for(let i = 0; i < badwords.length; i++){
		if(word.indexOf(badwords[i]) != -1) return true;
	}
	return false;
}
