#!/usr/bin/env python3
import sys
import myjdapi

# ---- CONFIG ----
EMAIL = "nicolas.ebele@gmail.com"
PASSWORD = "nik01911"
DEVICE_NAME = "JDownloader@Docker"  # Nom exact sur my.jdownloader.org

# ---- CHECK PARAM ----
if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <URL> <DEST_DIR>")
    sys.exit(1)

LINK = sys.argv[1]
DEST_DIR = sys.argv[2]

# ---- CONNECT ----
jd = myjdapi.Myjdapi()
try:
    jd.connect(EMAIL, PASSWORD)
except Exception as e:
    print("Erreur de connexion :", e)
    sys.exit(1)

# ---- GET DEVICE ----
device = jd.get_device(DEVICE_NAME)
if not device:
    print(f"Appareil '{DEVICE_NAME}' introuvable.")
    sys.exit(1)

# ---- SEND LINK ----
device.linkgrabber.add_links([{
    "autostart": True,
    "links": LINK,
    "packageName": "AutoPackage",
    "destinationFolder": DEST_DIR,
    "extractPassword": None,
    "downloadPassword": None,
    "overwritePackagizerRules": True
}])

print(f"✅ Lien envoyé à {DEVICE_NAME} :", LINK)
