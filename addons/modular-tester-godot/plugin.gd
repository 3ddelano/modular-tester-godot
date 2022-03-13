tool
extends EditorPlugin

"""
Modular Tester Godot Plugin
https://github.com/3ddelano/modular-tester-godot
MIT License (See LICENSE.md)

Copyright (c) 2022 Delano Lourenco
"""

func _enter_tree():
	# Ensure the addon in placed in res://addons/modular-tester-godot
	var path: String = get_script().get_path()
	var base_dir = path.get_base_dir()

	if base_dir != "res://addons/modular-tester-godot":
		var found_folder = base_dir.substr(0, base_dir.length() - "modular-tester-godot".length())
		printerr("Error: modular-tester-godot folder must be in res://addons/ but it was found in %s" % found_folder)

	add_autoload_singleton("TestUtils", "res://addons/modular-tester-godot/test_utils.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("TestUtils")
