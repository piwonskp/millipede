#!/usr/bin/python3

import gi
import requests

gi.require_version('Gtk', '3.0')


from gi.repository import Gtk

builder = Gtk.Builder()
builder.add_from_file("interface.glade")

window = builder.get_object("window")

app_version = builder.get_object("app-version")
server_version = builder.get_object("server-version")
refresh = builder.get_object("refresh")
close = builder.get_object("close")

app_version.set_text("Python")


def update_server_version(button):
    version = requests.get('http://web:8000/version/').json()['version']
    server_version.set_text(str(version))


close.connect("clicked", lambda _: window.destroy())
refresh.connect("clicked", update_server_version)

window.show_all()
Gtk.main()
