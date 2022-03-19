extends Node2D


var req = HTTPRequest.new()

func _ready() -> void:
	add_child(req)
	req.connect("request_completed", self, "_on_req_completed")
	req.set_download_file("user://hello.txt")

	var e = req.request("http://0x0.st/-FeX.txt")
	if e:
		print("request error: ", e)

	yield(req, "request_completed")

	var f: File = File.new()
	var fe = f.open("user://hello.txt", File.READ)
	if fe:
		print("error: ", fe)
	else:
		print(f.get_as_text())

	get_tree().quit()


func _on_req_completed(result, response_code, headers, body) -> void:
	print(result)
	print(response_code)
	print(headers.join("\t"))
	print(body.get_string_from_utf8())
